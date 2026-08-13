! function() {
    var t = {
            54278: function(t, n, e) {
                var a = {
                    "./configureGroupOneTimePayoutComponent.js": 24579,
                    "./configureGroupPayoutsComponent.js": 38111,
                    "./configureGroupRecurringPayoutComponent.js": 341,
                    "./groupAddFunds.js": 11742,
                    "./groupPayoutsComponent.js": 90681
                };

                function o(t) {
                    var n = r(t);
                    return e(n)
                }

                function r(t) {
                    if (!e.o(a, t)) {
                        var n = new Error("Cannot find module '" + t + "'");
                        throw n.code = "MODULE_NOT_FOUND", n
                    }
                    return a[t]
                }
                o.keys = function() {
                    return Object.keys(a)
                }, o.resolve = r, t.exports = o, o.id = 54278
            },
            38911: function(t, n, e) {
                var a = {
                    "./groupPayoutsConstants.js": 44250
                };

                function o(t) {
                    var n = r(t);
                    return e(n)
                }

                function r(t) {
                    if (!e.o(a, t)) {
                        var n = new Error("Cannot find module '" + t + "'");
                        throw n.code = "MODULE_NOT_FOUND", n
                    }
                    return a[t]
                }
                o.keys = function() {
                    return Object.keys(a)
                }, o.resolve = r, t.exports = o, o.id = 38911
            },
            96475: function(t, n, e) {
                var a = {
                    "./addPayoutRecipientModalController.js": 61364,
                    "./configureGroupOneTimePayoutController.js": 43091,
                    "./configureGroupPayoutsController.js": 98807,
                    "./configureGroupRecurringPayoutController.js": 57317,
                    "./groupAddFundsController.js": 62119,
                    "./groupAddFundsModalController.js": 99750,
                    "./groupPayoutsController.js": 76311
                };

                function o(t) {
                    var n = r(t);
                    return e(n)
                }

                function r(t) {
                    if (!e.o(a, t)) {
                        var n = new Error("Cannot find module '" + t + "'");
                        throw n.code = "MODULE_NOT_FOUND", n
                    }
                    return a[t]
                }
                o.keys = function() {
                    return Object.keys(a)
                }, o.resolve = r, t.exports = o, o.id = 96475
            },
            59106: function(t, n, e) {
                var a = {
                    "./groupPayoutsService.js": 69397
                };

                function o(t) {
                    var n = r(t);
                    return e(n)
                }

                function r(t) {
                    if (!e.o(a, t)) {
                        var n = new Error("Cannot find module '" + t + "'");
                        throw n.code = "MODULE_NOT_FOUND", n
                    }
                    return a[t]
                }
                o.keys = function() {
                    return Object.keys(a)
                }, o.resolve = r, t.exports = o, o.id = 59106
            },
            28863: function(t, n, e) {
                var a = {
                    "./components/templates/addPayoutRecipientModal.html": 65441,
                    "./components/templates/configureGroupOneTimePayout.html": 24322,
                    "./components/templates/configureGroupPayouts.html": 93746,
                    "./components/templates/configureGroupRecurringPayout.html": 63028,
                    "./components/templates/groupAddFunds.html": 53350,
                    "./components/templates/groupAddFundsModal.html": 47393,
                    "./components/templates/groupPayouts.html": 90608
                };

                function o(t) {
                    var n = r(t);
                    return e(n)
                }

                function r(t) {
                    if (!e.o(a, t)) {
                        var n = new Error("Cannot find module '" + t + "'");
                        throw n.code = "MODULE_NOT_FOUND", n
                    }
                    return a[t]
                }
                o.keys = function() {
                    return Object.keys(a)
                }, o.resolve = r, t.exports = o, o.id = 28863
            },
            77525: function(t) {
                function n(t) {
                    return t.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function e(t) {
                    return t.split("/").pop().replace(".html", "")
                }
                var a = {
                    importFilesUnderPath: function(t) {
                        t.keys().forEach(t)
                    },
                    templateCacheGenerator: function(t, a, o, r) {
                        return t.module(a, []).run(["$templateCache", function(t) {
                            o && o.keys().forEach((function(a) {
                                var r = n(e(a));
                                t.put(r, o(a))
                            })), r && r.keys().forEach((function(a) {
                                var o = n(e(a));
                                t.put(o, r(a).replace(/<\/?script[^>]*>/gi, ""))
                            }))
                        }])
                    }
                };
                t.exports = a
            },
            24579: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = {
                    templateUrl: "configure-group-one-time-payout",
                    bindings: {
                        groupId: "<",
                        groupFunds: "<",
                        reloadGroupFunds: "="
                    },
                    controller: "configureGroupOneTimePayoutController"
                };
                e(62313).A.component("configureGroupOneTimePayout", a), n.default = a
            },
            38111: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = {
                    templateUrl: "configure-group-payouts",
                    bindings: {
                        groupId: "<",
                        groupFunds: "<",
                        reloadGroupFunds: "="
                    },
                    controller: "configureGroupPayoutsController"
                };
                e(62313).A.component("configureGroupPayouts", a), n.default = a
            },
            341: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = {
                    templateUrl: "configure-group-recurring-payout",
                    bindings: {
                        groupId: "<",
                        groupFunds: "<"
                    },
                    controller: "configureGroupRecurringPayoutController"
                };
                e(62313).A.component("configureGroupRecurringPayout", a), n.default = a
            },
            11742: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = {
                    templateUrl: "group-add-funds",
                    bindings: {
                        group: "<"
                    },
                    controller: "groupAddFundsController"
                };
                e(62313).A.component("groupAddFunds", a), n.default = a
            },
            90681: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = {
                    templateUrl: "group-payouts",
                    bindings: {
                        groupId: "<",
                        groupFunds: "<",
                        policies: "<"
                    },
                    controller: "groupPayoutsController"
                };
                e(62313).A.component("groupPayouts", a), n.default = a
            },
            44250: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = e(87577),
                    o = e(62313),
                    r = {
                        urls: {
                            getPayoutsUrl: "".concat(a.EnvironmentUrls.groupsApi, "/v1/groups/{groupId}/payouts"),
                            postGroupPayoutUrl: "".concat(a.EnvironmentUrls.groupsApi, "/v1/groups/{groupId}/payouts"),
                            postGroupRecurringPayoutUrl: "".concat(a.EnvironmentUrls.groupsApi, "/v1/groups/{groupId}/payouts/recurring"),
                            groupPayoutRestrictionUrl: "".concat(a.EnvironmentUrls.groupsApi, "/v1/groups/{groupId}/payout-restriction"),
                            getAddFundsLatestUrl: "".concat(a.EnvironmentUrls.economyApi, "/v1/groups/{groupId}/addfunds/latest"),
                            postAddFundsUrl: "".concat(a.EnvironmentUrls.economyApi, "/v1/groups/{groupId}/addfunds"),
                            getUsersGroupPayoutEligibility: "".concat(a.EnvironmentUrls.economyApi, "/v1/groups/{groupId}/users-payout-eligibility")
                        },
                        payoutTypes: {
                            Amount: "Amount",
                            Percent: "Percentage"
                        },
                        apiPayoutTypes: {
                            Amount: "FixedAmount",
                            Percent: "Percentage"
                        },
                        payoutRecipientTypes: {
                            User: "User",
                            Group: "Group"
                        },
                        addFundsMaxRobuxDefault: 1e7,
                        addFundsErrorCodeMessages: {
                            14: "Message.MaximumExceeded",
                            16: "Message.InsufficentFunds"
                        },
                        guestRoleset: {
                            name: "Guest",
                            rank: 0
                        }
                    };
                o.A.constant("groupPayoutsConstants", r), n.default = r
            },
            61364: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = e(62313);

                function o(t, n, e, a, o, r, s, i, u) {
                    n.params = a, n.addPayoutRecipients = function() {
                        n.params.addPayoutRecipients(n.recipients), e.dismiss()
                    }, n.isUserAlreadyPayoutRecipient = function(t) {
                        var e = n.params.recipients.filter((function(n) {
                            return n.userId === t
                        }));
                        return e && e.length > 0
                    }, n.selectUser = function(e) {
                        return t((function(t, a) {
                            if (n.layout.isLoadingUser = !0, n.isUserAlreadyPayoutRecipient(e.id)) return n.layout.isLoadingUser = !1, void a(i.get("Message.UserAlreadyAdded"));
                            o.getUserRoleInGroup(e.id, n.params.groupId).then((function(o) {
                                o ? u.getUserPayoutEligibility(n.params.groupId, e.id).then((function(r) {
                                    if ("Eligible" === r.usersGroupPayoutEligibility[e.id]) {
                                        var u = {
                                            role: o.name,
                                            id: e.id,
                                            name: e.name,
                                            displayName: e.displayName,
                                            url: s.profilePageUrl(e.id)
                                        };
                                        n.recipients.push(u), t()
                                    } else a(i.get("Message.UserGroupPayoutIneligible"))
                                })) : a(i.get("Message.TargetUserNotInGroup"))
                            }), (function(t) {
                                a(t)
                            })).finally((function() {
                                n.layout.isLoadingUser = !1
                            }))
                        }))
                    }, n.removeUser = function(t) {
                        n.recipients.splice(t, 1)
                    }, n.close = function() {
                        e.dismiss()
                    }, n.init = function() {
                        n.thumbnailTypes = r.thumbnailTypes, n.layout = {}, n.recipients = []
                    }, n.init()
                }
                o.$inject = ["$q", "$scope", "$uibModalInstance", "modalData", "groupsService", "thumbnailConstants", "groupUtilityService", "languageResource", "groupPayoutsService"], a.A.controller("addPayoutRecipientModalController", o), n.default = o
            },
            43091: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = e(87577),
                    o = e(62313);

                function r(t, n, e, o, r, s, i, u, l, d, c) {
                    var p = this;
                    p.showAddPayoutRecipientModal = function() {
                        var t = {
                            animation: !1,
                            templateUrl: "add-payout-recipient-modal",
                            controller: "addPayoutRecipientModalController",
                            resolve: {
                                modalData: {
                                    groupId: p.groupId,
                                    recipients: p.payouts.users,
                                    addPayoutRecipients: p.addPayoutRecipients
                                }
                            }
                        };
                        n.open(t)
                    }, p.addPayoutRecipients = function(t) {
                        t.forEach((function(t) {
                            p.payouts.users.push({
                                userId: t.id,
                                username: t.name,
                                nameForDisplay: t.displayName,
                                role: t.role,
                                url: t.url,
                                amount: 0,
                                calcAmount: 0
                            })
                        }))
                    }, p.updatePayoutType = function(t) {
                        p.payouts.type = t, p.layout.maxPayoutValue = p.payouts.type === o.payoutTypes.Percent ? 100 : p.payouts.revenue, p.resetPayout()
                    }, p.resetPayout = function() {
                        p.payouts.users.forEach((function(t) {
                            t.amount = 0, t.calcAmount = 0
                        })), p.payouts.remaining = p.payouts.revenue, p.payouts.paying = 0, p.layout.fundsError = null
                    }, p.updatePayout = function() {
                        var t = 0;
                        p.payouts.users.forEach((function(n) {
                            n.calcAmount = p.payouts.type === p.layout.payoutTypes.Amount ? n.amount : Math.floor(p.payouts.revenue * (.01 * n.amount)), t += n.calcAmount
                        }));
                        var n = p.payouts.revenue - t;
                        n < 0 ? (p.layout.fundsError = l.get("Message.NotEnoughFundsDistribute"), p.payouts.paying = t, p.payouts.remaining = 0) : (p.layout.fundsError = null, p.payouts.remaining = n, p.payouts.paying = t)
                    }, p.removeUser = function(t) {
                        p.payouts.users.splice(t, 1), p.updatePayout()
                    }, p.getPayoutTypeLabel = function(t) {
                        var n = i.setTranslations();
                        return n.payoutTypes[t] ? n.payoutTypes[t] : o.payoutTypes[t]
                    }, p.showVerificationRedirectModal = function() {
                        d.sendFrictionEvent(c.events.settingsRedirectModalTriggered);
                        n.open({
                            animation: !1,
                            templateUrl: "verification-redirect-modal",
                            controller: "verificationRedirectModalController"
                        })
                    }, p.showVerificationInputModal = function(t) {
                        if (t) {
                            var e = a.AccountIntegrityChallengeService.TwoStepVerification;
                            d.popUpTwoStepVerificationChallenge(c.events.codeInputModalTriggered, e)
                        } else {
                            n.open({
                                animation: !1,
                                templateUrl: "verification-input-modal",
                                controller: "verificationInputModalController"
                            })
                        }
                    }, p.sendPayment = function() {
                        p.layout.isPayoutPending = !0;
                        var n = o.apiPayoutTypes.Amount;
                        p.payouts.type === p.layout.payoutTypes.Percent && (n = p.layout.payoutTypes.Percent);
                        var e = [];
                        p.payouts.users.forEach((function(t) {
                            e.push({
                                recipientId: t.userId,
                                recipientType: o.payoutRecipientTypes.User,
                                amount: t.amount
                            })
                        })), i.postGroupPayout(p.groupId, n, e).then((function() {
                            var n = t("number")(p.payouts.paying, 0);
                            p.reloadGroupFunds().then((function(t) {
                                p.initPayouts(t)
                            })).finally((function() {
                                p.layout.isPayoutPending = !1
                            })), u.success(l.get("Message.AmountPaidOut", {
                                amount: n
                            }))
                        }), (function(t) {
                            t.errors && t.errors.length > 0 && (t.errors[0].code === r.errorCodes.internal.twoStepVerificationRequired ? d.getTwoStepVerificationConfiguration().then((function(t) {
                                t.twoStepEnabled ? p.showVerificationInputModal(t.usingTwoStepWebviewComponent) : p.showVerificationRedirectModal()
                            })).catch((function() {
                                p.showVerificationRedirectModal()
                            })) : u.warning(l.get("Message.DistributeFundsError"))), p.layout.isPayoutPending = !1
                        }))
                    }, p.isDistributeButtonDisabled = function() {
                        return p.layout.fundsError || 0 === p.payouts.users.length || 0 === p.payouts.paying || p.layout.isPayoutPending
                    }, p.initPayouts = function(t) {
                        p.layout.maxPayoutValue = t, p.payouts = {
                            users: [],
                            paying: 0,
                            type: p.layout.payoutTypes.Amount,
                            revenue: t,
                            remaining: t
                        }
                    }, p.loadPayoutRestriction = function() {
                        p.layout.isLoading = !0, i.getGroupPayoutRestriction(p.groupId).then((function(t) {
                            p.layout.canUseOneTimePayout = t.canUseOneTimePayout
                        }), (function() {
                            p.layout.loadError = !0, $log.debug("Failed to load group payout restriction.")
                        })).finally((function() {
                            p.layout.isLoading = !1
                        }))
                    };
                    p.$onInit = function() {
                        p.thumbnailTypes = e.thumbnailTypes, p.layout = {
                            payoutTypes: o.payoutTypes
                        }, p.loadPayoutRestriction(), p.initPayouts(p.groupFunds)
                    }
                }
                r.$inject = ["$filter", "$uibModal", "thumbnailConstants", "groupPayoutsConstants", "groupsConstants", "groupsService", "groupPayoutsService", "systemFeedbackService", "languageResource", "verificationService", "verificationResources"], o.A.controller("configureGroupOneTimePayoutController", r), n.default = r
            },
            98807: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = e(87577),
                    o = e(62313);

                function r(t) {
                    var n = this;
                    n.$onInit = function() {
                        t.location.href = "https://create.".concat(a.EnvironmentUrls.domain, "/dashboard/group/payouts?groupId=").concat(n.groupId)
                    }
                }
                r.$inject = ["$window"], o.A.controller("configureGroupPayoutsController", r), n.default = r
            },
            57317: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = e(87577),
                    o = e(62313);

                function r(t, n, e, o, r, s, i, u, l, d, c) {
                    var p = this;
                    p.showAddPayoutRecipientModal = function() {
                        var t = {
                            animation: !1,
                            templateUrl: "add-payout-recipient-modal",
                            controller: "addPayoutRecipientModalController",
                            resolve: {
                                modalData: {
                                    groupId: p.groupId,
                                    recipients: p.payouts.users,
                                    addPayoutRecipients: p.addPayoutRecipients
                                }
                            }
                        };
                        n.open(t)
                    }, p.loadPayouts = function() {
                        p.layout.isLoading = !0, t.getGroupPayoutRecipients(p.groupId).then((function(t) {
                            0 === t.length && (p.layout.isLoading = !1), t.forEach((function(t) {
                                var n = t.user,
                                    e = n.id,
                                    a = n.name,
                                    o = n.displayName;
                                p.payouts.users.push({
                                    userId: e,
                                    username: a,
                                    nameForDisplay: o,
                                    role: t.role.name,
                                    amount: t.percentage,
                                    url: u.profilePageUrl(e)
                                }), p.payouts.paying += t.percentage, p.payouts.userInput = ""
                            }))
                        }), (function() {
                            p.layout.loadError = !0, e.debug("Failed to load group payout recipients.")
                        })).finally((function() {
                            p.layout.isLoading = !1
                        }))
                    }, p.addPayoutRecipients = function(t) {
                        t.forEach((function(t) {
                            var n = t.id,
                                e = t.displayName,
                                a = t.name;
                            p.payouts.users.push({
                                userId: n,
                                username: a,
                                displayName: e,
                                nameForDisplay: e,
                                role: t.role,
                                amount: 0,
                                url: t.url
                            })
                        }))
                    }, p.updatePayout = function() {
                        var t = 0;
                        p.payouts.users.forEach((function(n) {
                            t += n.amount
                        })), 100 - t < 0 ? (p.layout.fundsError = l.get("Message.NotEnoughFundsDistribute"), p.payouts.paying = t) : (p.layout.fundsError = null, p.payouts.paying = t)
                    }, p.removeUser = function(t) {
                        p.payouts.users.splice(t, 1), p.updatePayout()
                    }, p.showVerificationRedirectModal = function() {
                        d.sendFrictionEvent(c.events.settingsRedirectModalTriggered);
                        n.open({
                            animation: !1,
                            templateUrl: "verification-redirect-modal",
                            controller: "verificationRedirectModalController"
                        })
                    }, p.showVerificationInputModal = function(t) {
                        if (t) {
                            var e = a.AccountIntegrityChallengeService.TwoStepVerification;
                            d.popUpTwoStepVerificationChallenge(c.events.codeInputModalTriggered, e)
                        } else {
                            n.open({
                                animation: !1,
                                templateUrl: "verification-input-modal",
                                controller: "verificationInputModalController"
                            })
                        }
                    }, p.updateRecurringPayout = function() {
                        var n = r.apiPayoutTypes.Percent,
                            e = [];
                        p.payouts.users.forEach((function(t) {
                            e.push({
                                recipientId: t.userId,
                                recipientType: r.payoutRecipientTypes.User,
                                amount: t.amount
                            })
                        })), t.postGroupRecurringPayout(p.groupId, n, e).then((function() {
                            i.success(l.get("Message.PercentagePaidOut", {
                                percentage: p.payouts.paying
                            }))
                        }), (function(t) {
                            t.errors && t.errors.length > 0 && (t.errors[0].code === s.errorCodes.internal.twoStepVerificationRequired ? d.getTwoStepVerificationConfiguration().then((function(t) {
                                t.twoStepEnabled ? p.showVerificationInputModal(t.usingTwoStepWebviewComponent) : p.showVerificationRedirectModal()
                            })).catch((function() {
                                p.showVerificationRedirectModal()
                            })) : i.warning(l.get("Message.UpdateRecurringPayoutsError")))
                        }))
                    }, p.loadPayoutRestriction = function() {
                        p.layout.isLoading = !0, t.getGroupPayoutRestriction(p.groupId).then((function(t) {
                            p.layout.canUseRecurringPayout = t.canUseRecurringPayout
                        }), (function() {
                            p.layout.loadError = !0, e.debug("Failed to load group payout restriction.")
                        })).finally((function() {
                            p.layout.isLoading = !1
                        }))
                    };
                    p.$onInit = function() {
                        p.layout = {}, p.thumbnailTypes = o.thumbnailTypes, p.payouts = {
                            users: [],
                            paying: 0
                        }, p.loadPayoutRestriction(), p.loadPayouts()
                    }
                }
                r.$inject = ["groupPayoutsService", "$uibModal", "$log", "thumbnailConstants", "groupPayoutsConstants", "groupsConstants", "systemFeedbackService", "groupUtilityService", "languageResource", "verificationService", "verificationResources"], o.A.controller("configureGroupRecurringPayoutController", r), n.default = r
            },
            62119: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = e(62313),
                    o = e(87577);

                function r(t, n, e, a, r) {
                    var s = this;

                    function i(t, e) {
                        var a = r.addFundsErrorCodeMessages[t] || "Message.GeneralAddFundsError";
                        return n("translate")(a, e)
                    }
                    s.userId = o.CurrentUser.userId, s.userName = o.CurrentUser.name, s.addFunds = function(n) {
                        var e = {
                            animation: !1,
                            templateUrl: "group-add-funds-modal",
                            controller: "groupAddFundsModalController",
                            resolve: {
                                modalData: {
                                    robuxAmount: n,
                                    CurrentUser: o.CurrentUser,
                                    group: s.group
                                }
                            }
                        };
                        t.open(e)
                    }, s.inputChanged = function(t, e) {
                        if (e > s.addFundsMaxRobux) {
                            var a = n("number")(s.addFundsMaxRobux);
                            s.inputError = i(14, {
                                robux: a
                            })
                        } else e > s.userBalance ? s.inputError = i(16) : s.inputError = void 0
                    }, s.isTransferDisabled = function(t) {
                        return "string" == typeof s.inputError || null === t || isNaN(t)
                    };
                    s.$onInit = function() {
                        s.inputError = void 0, s.addFundsMaxRobux = r.addFundsMaxRobuxDefault, s.userBalance = s.addFundsMaxRobux, a.getUserCurrency(s.userId).then((function(t) {
                            s.userBalance = t || s.userBalance
                        })), e.getAddFundsLatest(s.group.id).then((function(t) {
                            s.transactionDate = t.transactionDate, s.rateLimitInDays = t.rateLimitInDays, s.addFundsMaxRobux = t.addFundsMaxRobux || s.addFundsMaxRobux
                        }))
                    }
                }
                r.$inject = ["$uibModal", "$filter", "groupPayoutsService", "groupsService", "groupPayoutsConstants"], a.A.controller("groupAddFundsController", r), n.default = r
            },
            99750: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = e(62313);

                function o(t, n, e, a, o, r, s, i) {
                    t.params = a, t.addFunds = function() {
                        o.postAddFunds(a.group.id, a.robuxAmount).then((function(t) {
                            location.reload()
                        }), (function(t) {
                            var a = n("translate")(function(t) {
                                var n = t.errors[0].code;
                                return r.addFundsErrorCodeMessages[n] || "Message.GeneralAddFundsError"
                            }(t));
                            s.warning(a), e.close()
                        }))
                    };
                    var u = i.robuxIconHtml + n("number")(a.robuxAmount);
                    t.robuxWithIcon = '<span class="add-funds-robux">'.concat(u, "</span>"), t.close = function() {
                        e.dismiss()
                    }
                }
                o.$inject = ["$scope", "$filter", "$uibModalInstance", "modalData", "groupPayoutsService", "groupPayoutsConstants", "systemFeedbackService", "groupsConstants"], a.A.controller("groupAddFundsModalController", o), n.default = o
            },
            76311: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = e(62313);

                function o(t, n, e, a) {
                    var o = this;
                    o.getRemainingPercentage = function() {
                        var t = 100;
                        return o.recipients.forEach((function(n) {
                            t -= n.percentageData
                        })), Math.ceil(t, 0)
                    };
                    var r = function() {
                        o.policies && o.policies.isGracefulDegradationEnabled || (o.recipients = [], o.thumbnailTypes = e.thumbnailTypes, n.getGroupPayoutRecipients(o.groupId).then((function(t) {
                            o.recipients = t
                        }), (function() {
                            t.debug("Failed to load group payout recipients.")
                        })))
                    };
                    o.$onInit = r, o.$onChanges = r
                }
                o.$inject = ["$log", "groupPayoutsService", "thumbnailConstants", "groupPayoutsConstants"], a.A.controller("groupPayoutsController", o), n.default = o
            },
            62313: function(t, n, e) {
                "use strict";
                var a = e(87577),
                    o = e(10127),
                    r = e.n(o)().module("groupPayouts", ["robloxApp", "groupPayoutsTemplates", "thumbnails", "groups", "ui.bootstrap"]).config(["languageResourceProvider", function(t) {
                        var n = new a.TranslationResourceProvider,
                            e = n.getTranslationResource("Feature.Groups"),
                            o = n.getTranslationResource("Authentication.TwoStepVerification");
                        t.setTranslationResources([e, o])
                    }]);
                n.A = r
            },
            69397: function(t, n, e) {
                "use strict";
                e.r(n);
                var a = e(62313);

                function o(t, n, e, a, o, r, s) {
                    return {
                        getGroupPayoutRecipients: function(r) {
                            var i = {
                                url: e("formatString")(o.urls.getPayoutsUrl, {
                                    groupId: r
                                })
                            };
                            return n((function(e, u) {
                                return t.httpGet(i).then((function(t) {
                                    var i = t.data.map((function(t) {
                                            return {
                                                user: {
                                                    id: t.user.userId,
                                                    name: t.user.username,
                                                    displayName: t.user.displayName
                                                },
                                                percentage: t.percentage
                                            }
                                        })),
                                        l = [];
                                    i.forEach((function(t) {
                                        l.push(s.getUserRoleInGroup(t.user.id, r))
                                    })), n.all(l).then((function(t) {
                                        for (var n = 0; n < t.length; n++) {
                                            var a = t[n];
                                            null == a && (a = o.guestRoleset), i[n].role = a
                                        }
                                        e(i)
                                    }), (function(t) {
                                        a.debug("--error waiting for userRoleInGroup promises---"), u(t)
                                    }))
                                }), (function(n) {
                                    var e = t.getApiErrorCodes(n);
                                    u(e[0] || 0)
                                }))
                            }))
                        },
                        postGroupPayout: function(n, a, r) {
                            var s = {
                                    url: e("formatString")(o.urls.postGroupPayoutUrl, {
                                        groupId: n
                                    })
                                },
                                i = {
                                    PayoutType: a,
                                    Recipients: r
                                };
                            return t.httpPost(s, i)
                        },
                        setTranslations: function() {
                            return {
                                payoutTypes: {
                                    Percentage: r.get("Label.Percentage"),
                                    Amount: r.get("Heading.Amount")
                                }
                            }
                        },
                        postGroupRecurringPayout: function(n, a, r) {
                            var s = {
                                    url: e("formatString")(o.urls.postGroupRecurringPayoutUrl, {
                                        groupId: n
                                    })
                                },
                                i = {
                                    PayoutType: a,
                                    Recipients: r
                                };
                            return t.httpPost(s, i)
                        },
                        getGroupPayoutRestriction: function(a) {
                            var r = {
                                url: e("formatString")(o.urls.groupPayoutRestrictionUrl, {
                                    groupId: a
                                })
                            };
                            return n((function(n, e) {
                                return t.httpGet(r).then((function(t) {
                                    n(t)
                                }), (function(n) {
                                    var a = t.getApiErrorCodes(n);
                                    e(a[0] || 0)
                                }))
                            }))
                        },
                        getAddFundsLatest: function(a) {
                            var r = {
                                url: e("formatString")(o.urls.getAddFundsLatestUrl, {
                                    groupId: a
                                })
                            };
                            return n((function(n, e) {
                                return t.httpGet(r).then((function(t) {
                                    n(t)
                                }), (function(n) {
                                    var a = t.getApiErrorCodes(n);
                                    e(a[0] || 0)
                                }))
                            }))
                        },
                        postAddFunds: function(n, a) {
                            var r = {
                                    url: e("formatString")(o.urls.postAddFundsUrl, {
                                        groupId: n
                                    })
                                },
                                s = {
                                    robuxAmount: a
                                };
                            return t.httpPost(r, s)
                        },
                        getUserPayoutEligibility: function(n, a) {
                            var r = {
                                    url: e("formatString")(o.urls.getUsersGroupPayoutEligibility, {
                                        groupId: n
                                    })
                                },
                                s = {
                                    userIds: a
                                };
                            return t.httpGet(r, s)
                        }
                    }
                }
                o.$inject = ["httpService", "$q", "$filter", "$log", "groupPayoutsConstants", "languageResource", "groupsService"], a.A.factory("groupPayoutsService", o), n.default = o
            },
            65441: function(t) {
                t.exports = '<div id="add-payout-recipient"> <div class="modal-header"> <button type="button" class="close" ng-click="close()"> <span class="icon-close"></span> </button> <div class="modal-title"> <h4 ng-bind="\'Label.AddPayoutRecipients\' | translate"></h4> </div> </div> <div class="modal-body"> <p class="body-text text-description" ng-bind="\'Label.EnterPayoutRecipient\' | translate"></p> <search-dropdown target-type="User" select="selectUser"></search-dropdown> <div class="payout-recipient-avatar-cards rbx-scrollbar"> <div class="avatar-card" ng-repeat="recipient in recipients"> <div class="avatar-card-container"> <div class="avatar avatar-headshot avatar-headshot-sm"> <a class="avatar-card-link" ng-href="{{ recipient.url }}" target="_blank"> <thumbnail-2d class="avatar-card-image" thumbnail-type="thumbnailTypes.avatarHeadshot" thumbnail-target-id="recipient.id"></thumbnail-2d> </a> </div> <div class="avatar-card-caption"> <div class="avatar-name text-overflow" ng-bind="recipient.displayName"></div> <div class="avatar-card-label text-secondary text-overflow" ng-bind="recipient.role"></div> </div> <button ng-click="removeUser($index)" class="delete-btn btn-generic-trash-bin-sm"> <span class="icon-trash-bin"></span> </button> </div> </div> <div class="avatar-card" ng-show="layout.isLoadingUser"> <span class="spinner spinner-sm"></span> </div> </div> </div> <div class="modal-buttons" toggle-loading="" is-inline="true" is-loading="layout.isLoading"> <button type="button" class="modal-button btn-primary-md" ng-disabled="layout.isLoadingUser || recipients.length === 0" ng-click="addPayoutRecipients()" ng-bind="\'Action.OK\' | translate"></button> <button type="button" class="modal-button btn-secondary-md" ng-click="close()" ng-bind="\'Action.Cancel\' | translate"></button> </div> </div>'
            },
            24322: function(t) {
                t.exports = '<div class="container-header"> <h2 ng-bind="\'Heading.OneTimePayout\' | translate"></h2> </div> <div class="section"> <div class="spinner spinner-default" ng-show="$ctrl.layout.isLoading"></div> <div ng-show="!$ctrl.layout.isLoading && $ctrl.layout.loadError" class="section-content-off" ng-bind="\'Message.LoadPayoutsError\' | translate"> </div> <div class="section-content-off" ng-show="!$ctrl.layout.isLoading &&\r\n    !$ctrl.layout.loadError && $ctrl.groupFunds == 0" ng-bind="\'Message.NoFundsDistribute\' | translate"> </div> <div class="section-content-off" ng-show="!$ctrl.layout.isLoading &&\r\n    !$ctrl.layout.loadError && $ctrl.groupFunds > 0 && !$ctrl.layout.canUseOneTimePayout" ng-bind="\'Message.PayoutRestricted\' | translate"> </div> <div class="one-time-payout" ng-show="!$ctrl.layout.isLoading &&\r\n    !$ctrl.layout.loadError && $ctrl.groupFunds > 0 && $ctrl.layout.canUseOneTimePayout"> <div class="distribute-header"> <span class="distribute-by-text" ng-bind="\'Label.DistributeBy\' | translate"></span> <div class="input-group"> <div class="input-group-btn dropdown" uib-dropdown=""> <button type="button" uib-dropdown-toggle="" class="input-dropdown-btn" ng-disabled="$ctrl.layout.isPayoutPending"> <span class="rbx-selection-label" data-bind="label" ng-bind="$ctrl.getPayoutTypeLabel($ctrl.payouts.type)"></span> <span class="icon-down-16x16"></span> </button> <ul class="dropdown-menu" role="menu" uib-dropdown-menu=""> <li ng-repeat="type in $ctrl.layout.payoutTypes"> <a ng-click="$ctrl.updatePayoutType(type)" ng-bind="$ctrl.getPayoutTypeLabel(type)"></a> </li> </ul> </div> </div> </div> <button class="btn-secondary-md add-payout-recipient-button" ng-click="$ctrl.showAddPayoutRecipientModal()" ng-disabled="$ctrl.layout.isPayoutPending" ng-bind="\'Label.AddPayoutRecipients\' | translate"></button> <table class="table table-striped payouts"> <tbody> <tr> <td class="user"></td> <td class="amount"></td> <td class="delete"></td> </tr> <tr ng-repeat="user in $ctrl.payouts.users"> <td class="user"> <div class="avatar-card"> <div class="avatar avatar-headshot avatar-headshot-xs"> <a ng-href="{{\'users\' | seoUrl: user.userId:\'profile\' }}" class="avatar-card-link"> <thumbnail-2d class="avatar-card-image" thumbnail-type="$ctrl.thumbnailTypes.avatarHeadshot" thumbnail-target-id="user.userId"></thumbnail-2d> </a> </div> <div class="avatar-card-caption"> <a ng-href="{{\'users\' | seoUrl: user.userId:\'profile\' }}" class="avatar-card-name text-lead text-overflow" ng-bind="user.nameForDisplay"></a> <div class="avatar-card-label text-secondary text-overflow" ng-bind="user.role"></div> </div> </div> </td> <td class="amount"> <div ng-class="{\'display-calc\': $ctrl.payouts.type == \'Percentage\'}" class="form-group payout-input"> <span class="amount"> <span ng-if="$ctrl.payouts.type == \'Amount\'" class="robux icon-robux-16x16"></span> <input ng-keyup="$ctrl.updatePayout(user.userId)" ng-model="user.amount" class="form-control input-field input-number" type="number" min="0" max="{{ $ctrl.layout.maxPayoutValue }}" oninput="validity.valid?this.save=value:value=this.save" ng-disabled="$ctrl.layout.isPayoutPending"/> <span ng-if="$ctrl.payouts.type == \'Percentage\'" class="percent">%</span> </span> <span ng-if="$ctrl.payouts.type == \'Percentage\'" class="calc icon-robux-container"> <span class="icon-robux-16x16"></span> <span ng-bind="user.calcAmount | number:0"></span> </span> </div> </td> <td class="delete"> <button ng-click="$ctrl.removeUser($index)" class="delete-btn btn-generic-trash-bin-sm"> <span class="icon-trash-bin"></span> </button> </td> </tr> <tr> <td colspan="2"> <div class="payout-calc"> <div class="icon-robux-container"> <span ng-bind="\'Label.PayingOut\' | translate"></span> <span class="icon-robux-16x16"></span> <span ng-bind="$ctrl.payouts.paying | number:0"></span> </div> <div class="icon-robux-container"> <span ng-bind="\'Label.RemainingFunds\' | translate"></span> <span class="icon-robux-16x16"></span> <span ng-bind="$ctrl.payouts.remaining | number:0"></span> </div> <div class="text-error" ng-if="$ctrl.layout.fundsError" ng-bind="$ctrl.layout.fundsError"> </div> </div> </td> <td></td> </tr> </tbody> </table> <div class="input-group-btn" toggle-loading="" is-inline="true"> <button type="button" class="save-button btn-primary-md" ng-disabled="$ctrl.isDistributeButtonDisabled()" ng-click="$ctrl.sendPayment()" ng-bind="\'Action.Distribute\' | translate"></button> </div> <span id="2sv-popup-container"></span> </div> </div>'
            },
            93746: function(t) {
                t.exports = '<span class="spinner spinner-default"></span> '
            },
            63028: function(t) {
                t.exports = '<div class="container-header"> <h2 ng-bind="\'Heading.RecurringPayout\' | translate"></h2> </div> <div class="section"> <div class="spinner spinner-default" ng-show="$ctrl.layout.isLoading"></div> <div ng-show="!$ctrl.layout.isLoading && $ctrl.layout.loadError" class="section-content-off" ng-bind="\'Message.LoadPayoutsError\' | translate"> </div> <div class="section-content-off" ng-show="!$ctrl.layout.isLoading &&\r\n        !$ctrl.layout.loadError && !$ctrl.layout.canUseRecurringPayout && $ctrl.groupFunds == 0" ng-bind="\'Message.NoFundsDistribute\' | translate"> </div> <div class="section-content-off" ng-show="!$ctrl.layout.isLoading &&\r\n        !$ctrl.layout.loadError && !$ctrl.layout.canUseRecurringPayout && $ctrl.groupFunds > 0" ng-bind="\'Message.PayoutRestricted\' | translate"> </div> <div ng-show="!$ctrl.layout.isLoading && !$ctrl.layout.loadError && $ctrl.layout.canUseRecurringPayout" class="recurring-payout"> <button class="btn-secondary-md add-payout-recipient-button" ng-click="$ctrl.showAddPayoutRecipientModal()" ng-bind="\'Label.AddPayoutRecipients\' | translate"></button> <table class="table table-striped payouts"> <tbody> <tr> <td class="user"></td> <td class="amount"></td> <td class="delete"></td> </tr> <tr ng-repeat="user in $ctrl.payouts.users"> <td class="user"> <div class="avatar-card"> <div class="avatar avatar-headshot avatar-headshot-xs"> <a class="avatar-card-link" ng-href="{{\'users\' | seoUrl: user.userId:\'profile\' }}"> <thumbnail-2d class="avatar-card-image" thumbnail-type="$ctrl.thumbnailTypes.avatarHeadshot" thumbnail-target-id="user.userId"></thumbnail-2d> </a> </div> <div class="avatar-card-caption"> <a class="avatar-card-name text-lead text-overflow" ng-href="{{\'users\' | seoUrl: user.userId:\'profile\' }}" ng-bind="user.nameForDisplay"></a> <div class="avatar-card-label text-secondary text-overflow" ng-bind="user.role"></div> </div> </div> </td> <td class="amount"> <div class="form-group payout-input"> <input ng-keyup="$ctrl.updatePayout(user.userId)" ng-model="user.amount" class="form-control input-field input-number" type="number" min="0" max="100" oninput="validity.valid?this.save=value:value=this.save"/> <span class="percent">%</span> </div> </td> <td class="delete"> <button ng-click="$ctrl.removeUser($index)" class="delete-btn btn-generic-trash-bin-sm"> <span class="icon-trash-bin"></span> </button> </td> </tr> <tr> <td colspan="2"> <div class="payout-calc"> <div> <span ng-bind="\'Label.PayingOut\' | translate"></span> <span ng-bind="$ctrl.payouts.paying | number:0"></span>% </div> <div> <span ng-bind="\'Label.RevenueToGroupFund\' | translate"></span> <span ng-bind="100 - $ctrl.payouts.paying | number:0"></span>% </div> <div class="text-error" ng-if="$ctrl.layout.fundsError" ng-bind="$ctrl.layout.fundsError"> </div> </div> </td> <td></td> </tr> </tbody> </table> <div class="input-group-btn" toggle-loading="" is-inline="true" is-loading="$ctrl.layout.isLoading"> <button type="button" class="save-button btn-secondary-md" ng-disabled="$ctrl.layout.fundsError" ng-click="$ctrl.updateRecurringPayout()" ng-bind="\'Action.Save\' | translate"></button> </div> </div> <span id="2sv-popup-container"></span> </div>'
            },
            53350: function(t) {
                t.exports = '<div id="add-funds" class="section"> <div class="container-header"> <h2 class="group-title-with-input" ng-bind="\'Label.AddFunds\' | translate"></h2> </div> <div ng-show="$ctrl.transactionDate" class="section-content remove-panel"> <div ng-bind="\'Label.LastAddedFunds\' | translate : { userName: $ctrl.userName, groupName: $ctrl.group.name, transferDate: $ctrl.transactionDate }"> </div> </div> <div ng-hide="$ctrl.transactionDate" class="section-content remove-panel"> <h4 class="add-funds-prompt font-header-2" ng-bind="\'Label.AddFundsPrompt\' | translate : { userName: $ctrl.userName, groupName: $ctrl.group.name}"></h4> <label class="text-label" for="robux-amount"> <span ng-bind="\'Label.AddFundsAmount\' | translate" class="ng-binding"></span> </label> <div class="form-group form-has-feedback" ng-class="{ \'form-has-error\': $ctrl.inputError }"> <span class="form-icon icon-robux-16x16"></span> <div class="add-funds-input"> <input id="robux-amount" class="form-control input-field input-number" type="number" ng-keyup="$ctrl.inputChanged($event, params.robuxAmount)" ng-model="params.robuxAmount"/> <p class="form-control-label" ng-bind-html="$ctrl.inputError"></p> </div> <button type="button" class="btn-secondary-md btn-action" ng-disabled="$ctrl.isTransferDisabled(params.robuxAmount)" ng-click="$ctrl.addFunds(params.robuxAmount)" ng-bind="\'Action.Transfer\' | translate"></button> </div> </div> <div ng-bind="\'Message.AddFundsLimitMessage\' | translate : { limit: $ctrl.rateLimitInDays }"></div> </div> '
            },
            47393: function(t) {
                t.exports = '<div class="modal-header"> <button type="button" class="close" ng-click="close()"> <span class="icon-close"></span> </button> <div class="modal-title"> <h4 ng-bind="\'Heading.AddFundsModal\' | translate"></h4> </div> </div> <div class="modal-body"> <p class="body-text text-description" ng-bind-html="\'Message.AddFundsModal\' | translate : { groupName: params.group.name, robuxWithIcon: robuxWithIcon }"></p> </div> <div class="modal-buttons"> <button type="button" class="modal-button btn-secondary-md" ng-click="close()" ng-bind="\'Action.No\' | translate"></button> <button type="submit" class="modal-button btn-secondary-md" ng-click="addFunds()" ng-bind="\'Action.Yes\' | translate"></button> </div> '
            },
            90608: function(t) {
                t.exports = '<div class="section" ng-if="$ctrl.recipients.length > 0"> <div class="container-header"> <h2 ng-bind="\'Heading.Payouts\' | translate"></h2> </div> <div class="section-content remove-panel"> <table class="table"> <tr class="border-top" ng-repeat="recipient in $ctrl.recipients"> <td class="user"> <div class="avatar-card"> <div class="avatar avatar-headshot avatar-headshot-sm"> <a ng-href="{{ \'users\' | seoUrl:recipient.user.id:\'profile\' }}" class="avatar-card-link"> <thumbnail-2d class="avatar-card-image" thumbnail-type="$ctrl.thumbnailTypes.avatarHeadshot" thumbnail-target-id="recipient.user.id"></thumbnail-2d> </a> </div> <div class="avatar-card-caption"> <a class="avatar-card-name text-lead text-overflow" ng-href="{{\'users\' | seoUrl: recipient.user.id:\'profile\' }}" ng-bind="recipient.user.displayName"></a> <div class="avatar-card-label text-secondary text-overflow" ng-bind="recipient.role.name"></div> </div> </div> </td> <td class="payout-percentage" ng-bind="recipient.percentage + \'%\'"></td> </tr> </table> </div> </div>'
            },
            87577: function(t) {
                "use strict";
                t.exports = Roblox
            },
            10127: function(t) {
                "use strict";
                t.exports = angular
            }
        },
        n = {};

    function e(a) {
        var o = n[a];
        if (void 0 !== o) return o.exports;
        var r = n[a] = {
            exports: {}
        };
        return t[a](r, r.exports, e), r.exports
    }
    e.n = function(t) {
            var n = t && t.__esModule ? function() {
                return t.default
            } : function() {
                return t
            };
            return e.d(n, {
                a: n
            }), n
        }, e.d = function(t, n) {
            for (var a in n) e.o(n, a) && !e.o(t, a) && Object.defineProperty(t, a, {
                enumerable: !0,
                get: n[a]
            })
        }, e.o = function(t, n) {
            return Object.prototype.hasOwnProperty.call(t, n)
        }, e.r = function(t) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(t, "__esModule", {
                value: !0
            })
        },
        function() {
            "use strict";
            var t = e(10127),
                n = e.n(t),
                a = e(77525);
            e(62313);
            (0, a.importFilesUnderPath)(e(96475)), (0, a.importFilesUnderPath)(e(59106)), (0, a.importFilesUnderPath)(e(54278)), (0, a.importFilesUnderPath)(e(38911));
            var o = e(28863);
            (0, a.templateCacheGenerator)(n(), "groupPayoutsTemplates", o)
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/fa841dc103182d276c10a1b98867a3ff-groupPayouts.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("GroupPayouts");