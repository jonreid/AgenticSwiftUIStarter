// TestableView by Jon Reid, https://qualitycoding.org
// Copyright 2024 Jonathan M. Reid. https://github.com/jonreid/TestableView/blob/main/LICENSE.txt
// SPDX-License-Identifier: MIT

@testable import AppNamePlaceholder
import SwiftUI
import ViewInspector
import XCTest

extension XCTestCase {
    @MainActor
    func inspectChangingView<V: TestableView>(
        _ sut: inout V,
        actionCapturingResult: @escaping ((InspectableView<ViewType.View<V>>) throws -> Void),
        file: StaticString = #filePath,
        line: UInt = #line,
    ) {
        render(
            &sut,
            host: { $0 },
            actionCapturingResult: actionCapturingResult,
            file: file,
            line: line,
        )
    }

    @MainActor
    func inspectView<V: TestableView, EnvironmentValue>(
        _ sut: inout V,
        environment keyPath: WritableKeyPath<EnvironmentValues, EnvironmentValue>,
        value: EnvironmentValue,
        actionCapturingResult: @escaping ((InspectableView<ViewType.View<V>>) throws -> Void),
        file: StaticString = #filePath,
        line: UInt = #line,
    ) {
        render(
            &sut,
            host: { $0.environment(keyPath, value) },
            actionCapturingResult: actionCapturingResult,
            file: file,
            line: line,
        )
    }

    @MainActor
    private func render<V: TestableView>(
        _ sut: inout V,
        host: (V) -> some View,
        actionCapturingResult: @escaping ((InspectableView<ViewType.View<V>>) throws -> Void),
        file: StaticString,
        line: UInt,
    ) {
        let rendered = sut.on(\.viewInspectorHook, file: file, line: line, perform: actionCapturingResult)
        ViewHosting.host(view: host(sut))
        defer { ViewHosting.expel() }
        wait(for: [rendered], timeout: 0.4)
    }
}
