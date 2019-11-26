/*
 * OPEN-XCHANGE legal information
 *
 * All intellectual property rights in the Software are protected by
 * international copyright laws.
 *
 *
 * In some countries OX, OX Open-Xchange and open xchange
 * as well as the corresponding Logos OX Open-Xchange and OX are registered
 * trademarks of the OX Software GmbH group of companies.
 * The use of the Logos is not covered by the Mozilla Public License 2.0 (MPL 2.0).
 * Instead, you are allowed to use these Logos according to the terms and
 * conditions of the Creative Commons License, Version 2.5, Attribution,
 * Non-commercial, ShareAlike, and the interpretation of the term
 * Non-commercial applicable to the aforementioned license is published
 * on the web site https://www.open-xchange.com/terms-and-conditions/.
 *
 * Please make sure that third-party modules and libraries are used
 * according to their respective licenses.
 *
 * Any modifications to this package must retain all copyright notices
 * of the original copyright holder(s) for the original code used.
 *
 * After any such modifications, the original and derivative code shall remain
 * under the copyright of the copyright holder(s) and/or original author(s) as stated here:
 * https://www.open-xchange.com/legal/. The contributing author shall be
 * given Attribution for the derivative code and a license granting use.
 *
 * Copyright (C) 2016-2019 OX Software GmbH
 * Mail: info@open-xchange.com
 *
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the Mozilla Public License 2.0
 * for more details.
 */

import Foundation
import SwiftyBeaver

let log = SwiftyBeaver.self

public class SwiftBackgroundFetchPlugin: NSObject, FlutterPlugin {
    
    private let registrar: FlutterPluginRegistrar!
    
    private struct BGTask {
        
        struct Identifier {
            static let Fetch = "me.coi.bgtask.fetch"
            static let Notification = "me.coi.bgtask.remote-notification"
            static let Processing = "me.coi.bgtask.processing"
        }
        
        struct Argument {
            static let StartOnBoot = "startOnBoot"
            static let MinimumFetchInterval = "minimumFetchInterval"
        }
    }
    
    private static let PLUGIN_PATH = "com.transistorsoft/flutter_background_fetch"
    private static let METHOD_CHANNEL_NAME = "methods"
    private static let EVENT_CHANNEL_NAME = "events"
    
    let ACTION_CONFIGURE = "configure"
    let ACTION_START = "start"
    let ACTION_STOP = "stop"
    let ACTION_FINISH = "finish"
    let ACTION_STATUS = "status"
    let ACTION_REGISTER_HEADLESS_TASK = "registerHeadlessTask"
    
    // MARK: - Initialization
    
    init(registrar: FlutterPluginRegistrar) {
        self.registrar = registrar
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        SwiftBackgroundFetchPlugin.setupLogging()

        let channel = FlutterMethodChannel(name: "\(PLUGIN_PATH)/\(METHOD_CHANNEL_NAME)", binaryMessenger: registrar.messenger())
        let delegate = SwiftBackgroundFetchPlugin(registrar: registrar)
        registrar.addMethodCallDelegate(delegate, channel: channel)
    }
    
    // MARK: - FlutterPlugin
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        log.info("Received Flutter Method Call: \(call.method)")
        if let arguments = call.arguments as? [String: Any?] {
            log.info("arguments: \(arguments)")
        }

        switch call.method {
            case ACTION_CONFIGURE:
                configure(call: call, result: result)
                break
            case ACTION_START:
                break
            case ACTION_STOP:
                break
            case ACTION_FINISH:
                break
            case ACTION_STATUS:
                break
            case ACTION_REGISTER_HEADLESS_TASK:
                result(NSNumber(value: true))
                break
            default:
                result(FlutterMethodNotImplemented)
        }
    }
    
    // MARK: - Handle Method Calls
    
    private func configure(call: FlutterMethodCall, result: FlutterResult) {
    }
    
    // MARK: - Logging

    private class func setupLogging() {
        // https://docs.swiftybeaver.com/article/20-custom-format
        let console = ConsoleDestination()
        console.format = "$Dyyyy-MM-dd HH:mm:ss $N.$F:$l [$L] $M"
        log.addDestination(console)

        log.debug("Logging Setup: done")
    }
}
