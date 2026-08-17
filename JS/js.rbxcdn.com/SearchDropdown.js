! function() {
    var r = {
            920: function(e, t, r) {
                var n = {
                    "./searchDropdownComponent.js": 410
                };

                function a(e) {
                    e = o(e);
                    return r(e)
                }

                function o(e) {
                    if (r.o(n, e)) return n[e];
                    e = new Error("Cannot find module '" + e + "'");
                    throw e.code = "MODULE_NOT_FOUND", e
                }
                a.keys = function() {
                    return Object.keys(n)
                }, a.resolve = o, (e.exports = a).id = 920
            },
            866: function(e, t, r) {
                var n = {
                    "./searchDropdownController.js": 879
                };

                function a(e) {
                    e = o(e);
                    return r(e)
                }

                function o(e) {
                    if (r.o(n, e)) return n[e];
                    e = new Error("Cannot find module '" + e + "'");
                    throw e.code = "MODULE_NOT_FOUND", e
                }
                a.keys = function() {
                    return Object.keys(n)
                }, a.resolve = o, (e.exports = a).id = 866
            },
            14: function(e, t, r) {
                var n = {
                    "./searchDropdownService.js": 507
                };

                function a(e) {
                    e = o(e);
                    return r(e)
                }

                function o(e) {
                    if (r.o(n, e)) return n[e];
                    e = new Error("Cannot find module '" + e + "'");
                    throw e.code = "MODULE_NOT_FOUND", e
                }
                a.keys = function() {
                    return Object.keys(n)
                }, a.resolve = o, (e.exports = a).id = 14
            },
            329: function(e, t, r) {
                var n = {
                    "./components/templates/searchDropdown.html": 574
                };

                function a(e) {
                    e = o(e);
                    return r(e)
                }

                function o(e) {
                    if (r.o(n, e)) return n[e];
                    e = new Error("Cannot find module '" + e + "'");
                    throw e.code = "MODULE_NOT_FOUND", e
                }
                a.keys = function() {
                    return Object.keys(n)
                }, a.resolve = o, (e.exports = a).id = 329
            },
            544: function(e) {
                function o(e) {
                    return e.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function s(e) {
                    return e.split("/").pop().replace(".html", "")
                }
                var t = {
                    importFilesUnderPath: function(e) {
                        e.keys().forEach(e)
                    },
                    templateCacheGenerator: function(e, t, n, a) {
                        return e.module(t, []).run(["$templateCache", function(r) {
                            n && n.keys().forEach(function(e) {
                                var t = o(s(e));
                                r.put(t, n(e))
                            }), a && a.keys().forEach(function(e) {
                                var t = o(s(e));
                                r.put(t, a(e).replace(/<\/?script[^>]*>/gi, ""))
                            })
                        }])
                    }
                };
                e.exports = t
            },
            410: function(e, t, r) {
                "use strict";
                r.r(t);
                var n = {
                    templateUrl: "search-dropdown",
                    bindings: {
                        targetType: "@",
                        select: "<"
                    },
                    controller: "searchDropdownController"
                };
                r(470).Z.component("searchDropdown", n), t.default = n
            },
            879: function(e, t, r) {
                "use strict";
                r.r(t);
                var i = r(792),
                    c = r(646),
                    n = r(470),
                    l = r(783);

                function a(e, r, n, a, o) {
                    function s(e) {
                        return e.key === a.arrowUp || e.key === a.arrowDown || e.key === a.tab
                    }
                    var u = this;
                    u.onKeyDown = function(e) {
                        var t;
                        s(e) && (e.stopPropagation(), e.preventDefault(), t = u.layout.cursorIndex, e.key === a.arrowUp ? --t : t += 1, (t %= e = u.data.searchResults.length) < 0 && (t = e + t), u.layout.cursorIndex = t)
                    };
                    u.searchTargetByName = function(t) {
                        u.layout.isOpen = !0, u.layout.isSearchRequestSending = !0, u.layout.errorMessage = void 0, n.cancel(u.timeoutOnSearch), u.timeoutOnSearch = n(function() {
                            r.debug(" --- searchTerm after timeout ".concat(t)), o.searchTargetByName(t, u.targetType).then(function(e) {
                                u.data.searchResults = e
                            }, function() {
                                u.layout.isOpen = !1, u.data.searchResults = []
                            }).finally(function() {
                                var e;
                                e = t, n.cancel(u.timeoutOnSearch), u.layout.isSearchRequestSending = !1, u.layout.previousSearchTerm !== e && u.searchTargetByName(u.layout.previousSearchTerm)
                            })
                        }, l.vt.timeout)
                    }, u.search = function(e) {
                        if (s(e)) return e.stopPropagation(), void e.preventDefault();
                        if (e.key === a.enter) return e.stopPropagation(), e.preventDefault(), u.layout.isSearchRequestSending ? void 0 : void(0 < u.data.searchResults.length && (u.selectOption(u.data.searchResults[u.layout.cursorIndex]), u.layout.focusMe = !1, e.target.blur()));
                        if (r.debug(" --- search ----- "), !u.data.searchTerm) return u.layout.isOpen = !1, void(u.data.searchResults = []);
                        e = u.data.searchTerm.trim();
                        0 < e.length && (r.debug(" --- search ----- searchTerm", e), u.timeoutOnSearch && (u.layout.previousSearchTerm = e), u.searchTargetByName(e))
                    }, u.selectOption = function(t) {
                        u.layout.isOpen = !1, u.layout.focusMe = !1, u.layout.isLoading = !0, u.select(t).then(function() {
                            u.data.searchTerm = "", u.layout.previousSearchTerm = "", u.data.searchResults = []
                        }, function(e) {
                            u.data.searchTerm = t.name, u.layout.errorMessage = e
                        }).finally(function() {
                            u.layout.isLoading = !1
                        })
                    };
                    u.$onInit = function() {
                        u.thumbnailTypes = c.ThumbnailTypes, u.thumbnailType = l.nn.getThumbnailTypeForTargetType(u.targetType), u.data = {
                            searchResults: []
                        }, u.layout = {
                            focusMe: !0,
                            cursorIndex: 0,
                            isDisplayNamesEnabled: i.DisplayNames.Enabled()
                        }, u.layout.placeholder = e("translate")(l.nn.getPlaceholderTranslationKeyForTargetType(u.targetType))
                    }
                }
                a.$inject = ["$filter", "$log", "$timeout", "keys", "searchDropdownService"], n.Z.controller("searchDropdownController", a), t.default = a
            },
            470: function(e, t, r) {
                "use strict";
                var n = r(734),
                    n = r.n(n),
                    a = r(792),
                    n = n().module("searchDropdown", ["searchDropdownHtmlTemplate", "thumbnails"]).config(["languageResourceProvider", function(e) {
                        var t = (new a.TranslationResourceProvider).getTranslationResource("Feature.SearchDropdownComponent");
                        e.setTranslationResources([t])
                    }]);
                t.Z = n
            },
            507: function(e, t, r) {
                "use strict";
                r.r(t);
                var n = r(470),
                    a = r(783);

                function o(e) {
                    return {
                        searchTargetByName: function(r, n) {
                            return e(function(e, t) {
                                a.nn.searchTargetByName(r, n).then(e, t)
                            })
                        }
                    }
                }
                o.$inject = ["$q"], n.Z.factory("searchDropdownService", o), t.default = o
            },
            574: function(e) {
                e.exports = '<div class="form-has-feedback search-dropdown" uib-dropdown="" is-open="$ctrl.layout.isOpen" keyboard-nav ng-class="{\'form-has-error\': $ctrl.layout.errorMessage}"> <input id="add-users-textbox" class="input-field form-control" uib-dropdown-toggle="" ng-model="$ctrl.data.searchTerm" focus-me="{{ $ctrl.layout.focusMe }}" placeholder="{{ $ctrl.layout.placeholder }}" ng-keyup="$ctrl.search($event)" ng-keydown="$ctrl.onKeyDown($event)" ng-disabled="$ctrl.layout.isLoading"> <ul class="dropdown-menu search-results-dropdown-menu" uib-dropdown-menu role="menu"> <li ng-show="$ctrl.layout.isSearchRequestSending" class="search-result-loading"> <div class="spinner spinner-sm"></div> </li> <li ng-hide="$ctrl.layout.isSearchRequestSending" ng-repeat="searchResult in $ctrl.data.searchResults" ng-class="{\'active\': $index === $ctrl.layout.cursorIndex}" class="search-result"> <a id="search-dropdown-result" class="search-result-format" ng-click="$ctrl.selectOption(searchResult)"> <thumbnail-2d thumbnail-type="$ctrl.thumbnailType" thumbnail-target-id="searchResult.id" class="search-result-icon" ng-class="{\'avatar-headshot\': $ctrl.thumbnailType === $ctrl.thumbnailTypes.avatarHeadshot}"> </thumbnail-2d> <div class="search-result-name text-overflow" ng-bind="searchResult.name" ng-if="!searchResult.displayName || !$ctrl.layout.isDisplayNamesEnabled"></div> <div class="search-result-name text-overflow" paired-name display-name="{{searchResult.displayName}} " user-name="{{searchResult.name}} " ng-if="searchResult.displayName && $ctrl.layout.isDisplayNamesEnabled"> </div> </a> </li> </ul> <p ng-if="$ctrl.layout.errorMessage" id="invite-user-error" class="form-control-label" ng-bind="$ctrl.layout.errorMessage"></p> </div>'
            },
            783: function(e, t, r) {
                "use strict";
                r.d(t, {
                    vt: function() {
                        return l
                    },
                    nn: function() {
                        return p
                    }
                });
                var n = r(646),
                    o = CoreUtilities,
                    t = r(792);
                (r = a = a || {}).User = "User", r.Group = "Group";

                function s(e, t) {
                    void 0 === t && (t = !1);
                    var r = {
                            url: h.userLookup
                        },
                        t = {
                            usernames: [e],
                            excludeBannedUsers: t
                        };
                    return o.httpService.post(r, t)
                }

                function u(a) {
                    return new Promise(function(r, e) {
                        var t, n;
                        n = {
                            url: h.groupLookup
                        }, t = {
                            groupName: t = a
                        }, o.httpService.get(n, t).then(function(e) {
                            var t;
                            0 < (null === (t = null === (t = e.data) || void 0 === t ? void 0 : t.data) || void 0 === t ? void 0 : t.length) && (e = e.data.data.slice(0, l.maxResultsShown), r(e)), r([])
                        }, function() {
                            e()
                        })
                    })
                }

                function i(a) {
                    return new Promise(function(n, e) {
                        var t, r;
                        r = {
                            url: h.userSearch
                        }, t = {
                            keyword: t = a,
                            limit: l.maxResults
                        }, o.httpService.get(r, t).then(function(r) {
                            var e;
                            if (!(0 < (null === (e = null === (e = r.data) || void 0 === e ? void 0 : e.data) || void 0 === e ? void 0 : e.length))) throw new Error("Search did not return any results");
                            r.data.data[0].name.toLowerCase() !== a.toLowerCase() ? s(a, !0).then(function(e) {
                                if (!(0 < (null === (t = null === (t = e.data) || void 0 === t ? void 0 : t.data) || void 0 === t ? void 0 : t.length))) throw new Error("Direct lookup did not return any results");
                                var t = r.data.data.slice(0, l.maxResultsShown - 1);
                                t.unshift(e.data.data[0]), n(t)
                            }).catch(function() {
                                var e = r.data.data.slice(0, l.maxResultsShown);
                                n(e)
                            }) : (e = r.data.data.slice(0, l.maxResultsShown), n(e))
                        }).catch(function() {
                            s(a, !0).then(function(e) {
                                var t;
                                0 < (null === (t = null === (t = e.data) || void 0 === t ? void 0 : t.data) || void 0 === t ? void 0 : t.length) ? n(e.data.data) : n([])
                            }, function() {
                                e()
                            })
                        })
                    })
                }
                var a, c = a,
                    l = {
                        maxResultsShown: 5,
                        maxResults: 10,
                        timeout: 300
                    },
                    d = ((a = {})[c.User] = {
                        minLength: 2,
                        maxLength: 20
                    }, a[c.Group] = {
                        minLength: 2,
                        maxLength: 50
                    }, a),
                    h = {
                        groupLookup: t.EnvironmentUrls.groupsApi + "/v1/groups/search/lookup",
                        userSearch: t.EnvironmentUrls.usersApi + "/v1/users/search",
                        userLookup: t.EnvironmentUrls.usersApi + "/v1/usernames/users"
                    };
                var p = {
                    searchTargetByName: function(a, o) {
                        return new Promise(function(e, t) {
                            var r = d[o],
                                n = r.minLength,
                                r = r.maxLength;
                            if (!a || a.length <= n || a.length > r) t();
                            else switch (o) {
                                case c.Group:
                                    e(u(a));
                                    break;
                                case c.User:
                                default:
                                    e(i(a))
                            }
                        })
                    },
                    getThumbnailTypeForTargetType: function(e) {
                        switch (e) {
                            case c.Group:
                                return n.ThumbnailTypes.groupIcon;
                            case c.User:
                            default:
                                return n.ThumbnailTypes.avatarHeadshot
                        }
                    },
                    getPlaceholderTranslationKeyForTargetType: function(e) {
                        switch (e) {
                            case c.Group:
                                return "Label.GroupName";
                            case c.User:
                            default:
                                return "Label.Username"
                        }
                    }
                }
            },
            792: function(e) {
                "use strict";
                e.exports = Roblox
            },
            646: function(e) {
                "use strict";
                e.exports = RobloxThumbnails
            },
            734: function(e) {
                "use strict";
                e.exports = angular
            }
        },
        n = {};

    function a(e) {
        if (n[e]) return n[e].exports;
        var t = n[e] = {
            exports: {}
        };
        return r[e](t, t.exports, a), t.exports
    }
    a.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return a.d(t, {
                a: t
            }), t
        }, a.d = function(e, t) {
            for (var r in t) a.o(t, r) && !a.o(e, r) && Object.defineProperty(e, r, {
                enumerable: !0,
                get: t[r]
            })
        }, a.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, a.r = function(e) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        },
        function() {
            "use strict";
            var e = a(734),
                t = a.n(e),
                r = a(544);
            a(470), (0, r.importFilesUnderPath)(a(866)), (0, r.importFilesUnderPath)(a(920)), (0, r.importFilesUnderPath)(a(14)), e = a(329), (0, r.templateCacheGenerator)(t(), "searchDropdownHtmlTemplate", e)
        }()
}();
//# sourceMappingURL=https://js.rbxcdn.com/086f278d0aeffe235c0e84646327a93d-searchDropdown.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("SearchDropdown");