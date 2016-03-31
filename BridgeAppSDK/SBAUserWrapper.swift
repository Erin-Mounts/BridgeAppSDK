//
//  SBAUserWrapper.swift
//  BridgeAppSDK
//
//  Copyright © 2016 Sage Bionetworks. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
// 1.  Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer.
//
// 2.  Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation and/or
// other materials provided with the distribution.
//
// 3.  Neither the name of the copyright holder(s) nor the names of any contributors
// may be used to endorse or promote products derived from this software without
// specific prior written permission. No license is granted to the trademarks of
// the copyright holders even if such marks are included in this software.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

import Foundation

// Wrapper support for reverse compatiblility to AppCore. syoung 03/28/2016

public protocol SBAUserWrapper: class, SBBAuthManagerDelegateProtocol {

    /**
     * SessionToken is stored in memory only
     */
    var sessionToken: String? { get set }

    /**
     * Name is stored in the keychain
     */
    var name: String? { get set }

    /**
     * Email is stored in the keychain.
     */
    var email: String? { get set }

    /**
     * ExternalId is stored in the keychain.
     */
    var externalId: String? { get set }

    /**
     * Password is stored in the keychain
     */
    var password: String? { get set }

    /**
     * Subpopulation GUID is used for tracking by certain apps. Stored in the keychain.
     */
    var subpopulationGuid: String? { get set }

    /**
     * Consent signature should be stored in keychain.
     */
    var consentSignature: SBAConsentSignature? { get set }

    /**
     * Data groups associated with this user.
     */
    var dataGroups: [String]? { get set }

    /**
     * The user has registered locally or the server has returned confirmation that the
     * user registered on a different device.
     */
    var hasRegistered: Bool { get set }   // signedUp

    /**
     * User email/password login has been verified on the server.
     */
    var loginVerified: Bool { get set }   // signedIn

    /**
     * The user's consent has been verified by the server.
     */
    var consentVerified: Bool { get set }

    /**
     * The user has "paused" their participation in the study and their data should *not*
     * be sent to the server.
     */
    var dataSharingEnabled: Bool { get set }

    /**
     * The sharing scope set by the user during consent
     */
    var dataSharingScope: SBBUserDataSharingScope { get set }

    /**
     * Log the user out and reset
     */
    func logout()

}
