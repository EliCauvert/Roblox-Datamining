;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "30e35277-35f6-0db3-55c2-ecce34eb4cde")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 671376, e => {
    "use strict";
    var t = e.i(307529);
    e.s(["Asset", () => t.default])
}, 54842, e => {
    "use strict";
    var t = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function i() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (i.prototype = t.prototype, new i)
    }

    function r(e, t, n, i) {
        return new(n || (n = Promise))(function(r, s) {
            function u(e) {
                try {
                    o(i.next(e))
                } catch (e) {
                    s(e)
                }
            }

            function a(e) {
                try {
                    o(i.throw(e))
                } catch (e) {
                    s(e)
                }
            }

            function o(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(u, a)
            }
            o((i = i.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var n, i, r, s = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return u.next = a(0), u.throw = a(1), u.return = a(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
            return this
        }), u;

        function a(a) {
            return function(o) {
                var v = [a, o];
                if (n) throw TypeError("Generator is already executing.");
                for (; u && (u = 0, v[0] && (s = 0)), s;) try {
                    if (n = 1, i && (r = 2 & v[0] ? i.return : v[0] ? i.throw || ((r = i.return) && r.call(i), 0) : i.next) && !(r = r.call(i, v[1])).done) return r;
                    switch (i = 0, r && (v = [2 & v[0], r.value]), v[0]) {
                        case 0:
                        case 1:
                            r = v;
                            break;
                        case 4:
                            return s.label++, {
                                value: v[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = v[1], v = [0];
                            continue;
                        case 7:
                            v = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = s.trys).length > 0 && r[r.length - 1]) && (6 === v[0] || 2 === v[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === v[0] && (!r || v[1] > r[0] && v[1] < r[3])) {
                                s.label = v[1];
                                break
                            }
                            if (6 === v[0] && s.label < r[1]) {
                                s.label = r[1], r = v;
                                break
                            }
                            if (r && s.label < r[2]) {
                                s.label = r[2], s.ops.push(v);
                                break
                            }
                            r[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    v = t.call(e, s)
                } catch (e) {
                    v = [6, e], i = 0
                } finally {
                    n = r = 0
                }
                if (5 & v[0]) throw v[1];
                return {
                    value: v[0] ? v[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function u(e) {
        var n;
        return null == (n = e) ? n : {
            category: (0, t.exists)(n, "category") ? n.category : void 0,
            rank: (0, t.exists)(n, "rank") ? n.rank : void 0
        }
    }

    function a(e) {
        if (void 0 !== e) return null === e ? null : {
            recurrence: e.recurrence,
            recurrenceEndTime: e.recurrenceEndTime,
            notificationAudience: e.notificationAudience
        }
    }

    function o(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function v(e) {
        var n;
        return null == (n = e) ? n : {
            mediaId: (0, t.exists)(n, "mediaId") ? n.mediaId : void 0,
            rank: (0, t.exists)(n, "rank") ? n.rank : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            mediaId: e.mediaId,
            rank: e.rank
        }
    }

    function d(e) {
        var n;
        return null == (n = e) ? n : {
            category: (0, t.exists)(n, "category") ? n.category : void 0,
            rank: (0, t.exists)(n, "rank") ? n.rank : void 0
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            category: e.category,
            rank: e.rank
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            startTime: e.startTime,
            endTime: e.endTime
        }
    }

    function h(e) {
        var n;
        return null == (n = e) ? n : {
            mediaId: (0, t.exists)(n, "mediaId") ? n.mediaId : void 0,
            rank: (0, t.exists)(n, "rank") ? n.rank : void 0
        }
    }

    function f(e) {
        var n, i, r;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            title: (0, t.exists)(n, "title") ? n.title : void 0,
            displayTitle: (0, t.exists)(n, "displayTitle") ? n.displayTitle : void 0,
            subtitle: (0, t.exists)(n, "subtitle") ? n.subtitle : void 0,
            displaySubtitle: (0, t.exists)(n, "displaySubtitle") ? n.displaySubtitle : void 0,
            description: (0, t.exists)(n, "description") ? n.description : void 0,
            displayDescription: (0, t.exists)(n, "displayDescription") ? n.displayDescription : void 0,
            startTime: (0, t.exists)(n, "startTime") ? null === n.startTime ? null : new Date(n.startTime) : void 0,
            endTime: (0, t.exists)(n, "endTime") ? null === n.endTime ? null : new Date(n.endTime) : void 0,
            universeId: (0, t.exists)(n, "universeId") ? n.universeId : void 0,
            placeId: (0, t.exists)(n, "placeId") ? n.placeId : void 0,
            host: (0, t.exists)(n, "host") ? null == (i = n.host) ? i : {
                hostType: (0, t.exists)(i, "hostType") ? i.hostType : void 0,
                hostId: (0, t.exists)(i, "hostId") ? i.hostId : void 0,
                hostName: (0, t.exists)(i, "hostName") ? i.hostName : void 0,
                hasVerifiedBadge: (0, t.exists)(i, "hasVerifiedBadge") ? i.hasVerifiedBadge : void 0
            } : void 0,
            visibility: (0, t.exists)(n, "visibility") ? n.visibility : void 0,
            featuringStatus: (0, t.exists)(n, "featuringStatus") ? n.featuringStatus : void 0,
            tagline: (0, t.exists)(n, "tagline") ? n.tagline : void 0,
            categories: (0, t.exists)(n, "categories") ? null === n.categories ? null : n.categories.map(u) : void 0,
            thumbnails: (0, t.exists)(n, "thumbnails") ? null === n.thumbnails ? null : n.thumbnails.map(h) : void 0,
            allThumbnailsCreated: (0, t.exists)(n, "allThumbnailsCreated") ? n.allThumbnailsCreated : void 0,
            config: (0, t.exists)(n, "config") ? null == (r = n.config) ? r : {
                recurrence: (0, t.exists)(r, "recurrence") ? r.recurrence : void 0,
                recurrenceEndTime: (0, t.exists)(r, "recurrenceEndTime") ? null === r.recurrenceEndTime ? null : new Date(r.recurrenceEndTime) : void 0,
                notificationAudience: (0, t.exists)(r, "notificationAudience") ? r.notificationAudience : void 0
            } : void 0,
            userRsvpStatus: (0, t.exists)(n, "userRsvpStatus") ? n.userRsvpStatus : void 0,
            createTime: (0, t.exists)(n, "createTime") ? null === n.createTime ? null : new Date(n.createTime) : void 0,
            updateTime: (0, t.exists)(n, "updateTime") ? null === n.updateTime ? null : new Date(n.updateTime) : void 0
        }
    }

    function m(e) {
        var n;
        return null == (n = e) ? n : {
            userId: (0, t.exists)(n, "userId") ? n.userId : void 0,
            rsvpStatus: (0, t.exists)(n, "rsvpStatus") ? n.rsvpStatus : void 0,
            shouldSeeNotificationsUpsellModal: (0, t.exists)(n, "shouldSeeNotificationsUpsellModal") ? n.shouldSeeNotificationsUpsellModal : void 0
        }
    }

    function g(e) {
        var n, i, r;
        return null == (n = e) ? n : {
            id: (0, t.exists)(n, "id") ? n.id : void 0,
            title: (0, t.exists)(n, "title") ? n.title : void 0,
            displayTitle: (0, t.exists)(n, "displayTitle") ? n.displayTitle : void 0,
            subtitle: (0, t.exists)(n, "subtitle") ? n.subtitle : void 0,
            displaySubtitle: (0, t.exists)(n, "displaySubtitle") ? n.displaySubtitle : void 0,
            description: (0, t.exists)(n, "description") ? n.description : void 0,
            displayDescription: (0, t.exists)(n, "displayDescription") ? n.displayDescription : void 0,
            eventTime: (0, t.exists)(n, "eventTime") ? null == (i = n.eventTime) ? i : {
                startUtc: (0, t.exists)(i, "startUtc") ? new Date(i.startUtc) : void 0,
                endUtc: (0, t.exists)(i, "endUtc") ? new Date(i.endUtc) : void 0
            } : void 0,
            host: (0, t.exists)(n, "host") ? null == (r = n.host) ? r : {
                hostName: (0, t.exists)(r, "hostName") ? r.hostName : void 0,
                hasVerifiedBadge: (0, t.exists)(r, "hasVerifiedBadge") ? r.hasVerifiedBadge : void 0,
                hostType: (0, t.exists)(r, "hostType") ? r.hostType : void 0,
                hostId: (0, t.exists)(r, "hostId") ? r.hostId : void 0
            } : void 0,
            universeId: (0, t.exists)(n, "universeId") ? n.universeId : void 0,
            placeId: (0, t.exists)(n, "placeId") ? n.placeId : void 0,
            eventStatus: (0, t.exists)(n, "eventStatus") ? n.eventStatus : void 0,
            eventVisibility: (0, t.exists)(n, "eventVisibility") ? n.eventVisibility : void 0,
            createdUtc: (0, t.exists)(n, "createdUtc") ? new Date(n.createdUtc) : void 0,
            updatedUtc: (0, t.exists)(n, "updatedUtc") ? new Date(n.updatedUtc) : void 0,
            eventCategories: (0, t.exists)(n, "eventCategories") ? null === n.eventCategories ? null : n.eventCategories.map(d) : void 0,
            thumbnails: (0, t.exists)(n, "thumbnails") ? null === n.thumbnails ? null : n.thumbnails.map(v) : void 0,
            allThumbnailsCreated: (0, t.exists)(n, "allThumbnailsCreated") ? n.allThumbnailsCreated : void 0,
            userRsvpStatus: n.userRsvpStatus,
            tagline: (0, t.exists)(n, "tagline") ? n.tagline : void 0,
            featuringStatus: (0, t.exists)(n, "featuringStatus") ? n.featuringStatus : void 0
        }
    }

    function E(e, n) {
        return null == e ? e : {
            nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
            previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
            data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(g) : void 0
        }
    }(function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.experienceEventsCreateExperienceEventRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/experience-events/create",
                                schemaPath: "/v1/experience-events/create",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        eventTime: o(e.eventTime),
                                        universeId: e.universeId,
                                        placeId: e.placeId,
                                        groupId: e.groupId,
                                        eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(c),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(l),
                                        visibility: e.visibility,
                                        config: a(e.config)
                                    }
                                }(e.experienceEventsCreateExperienceEventRequest)
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return g(e)
                            })]
                    }
                })
            })
        }, n.prototype.experienceEventsCreateExperienceEvent = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.experienceEventsCreateExperienceEventRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.experienceEventsUpdateExperienceEventRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling experienceEventsUpdateExperienceEvent.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/experience-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                schemaPath: "/v1/experience-events/{id}",
                                method: "PATCH",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        eventTime: p(e.eventTime),
                                        universeId: e.universeId,
                                        placeId: e.placeId,
                                        visibility: e.visibility,
                                        config: a(e.config),
                                        eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(c),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(l)
                                    }
                                }(e.experienceEventsUpdateExperienceEventRequest)
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return null == e ? e : {
                                    isUpdated: (0, t.exists)(e, "isUpdated") ? e.isUpdated : void 0,
                                    thumbnailsUpdated: (0, t.exists)(e, "thumbnailsUpdated") ? e.thumbnailsUpdated : void 0,
                                    categoriesUpdated: (0, t.exists)(e, "categoriesUpdated") ? e.categoriesUpdated : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.experienceEventsUpdateExperienceEvent = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.experienceEventsUpdateExperienceEventRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI),
    function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.gameEventDeleteRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.eventId || void 0 === e.eventId) throw new t.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventDelete.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                schemaPath: "/v3/game-events/{eventId}",
                                method: "DELETE",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.VoidApiResponse(u)]
                    }
                })
            })
        }, n.prototype.gameEventDelete = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventDeleteRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n.prototype.gameEventGetRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.eventId || void 0 === e.eventId) throw new t.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventGet.");
                            return i = {}, void 0 !== e.fields && (i.fields = e.fields), r = {}, [4, this.request({
                                path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                schemaPath: "/v3/game-events/{eventId}",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, n.prototype.gameEventGet = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventGetRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.gameEventUpdateRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.eventId || void 0 === e.eventId) throw new t.RequiredError("eventId", "Required parameter requestParameters.eventId was null or undefined when calling gameEventUpdate.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v3/game-events/{eventId}".replace("{".concat("eventId", "}"), encodeURIComponent(String(e.eventId))),
                                schemaPath: "/v3/game-events/{eventId}",
                                method: "PATCH",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        startTime: void 0 === e.startTime ? void 0 : null === e.startTime ? null : e.startTime.toISOString(),
                                        endTime: void 0 === e.endTime ? void 0 : null === e.endTime ? null : e.endTime.toISOString(),
                                        visibility: e.visibility,
                                        placeId: e.placeId,
                                        categories: void 0 === e.categories ? void 0 : null === e.categories ? null : e.categories.map(c),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(l),
                                        config: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                recurrence: e.recurrence,
                                                recurrenceEndTime: void 0 === e.recurrenceEndTime ? void 0 : null === e.recurrenceEndTime ? null : e.recurrenceEndTime.toISOString(),
                                                notificationAudience: e.notificationAudience
                                            }
                                        }(e.config),
                                        featuringStatus: e.featuringStatus,
                                        tagline: e.tagline
                                    }
                                }(e.gameEventUpdateRequest)
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, n.prototype.gameEventUpdate = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventUpdateRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.gameEventsCreateRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gameEventsCreate.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v3/universes/{universeId}/game-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v3/universes/{universeId}/game-events",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        title: e.title,
                                        subtitle: e.subtitle,
                                        description: e.description,
                                        startTime: void 0 === e.startTime ? void 0 : null === e.startTime ? null : e.startTime.toISOString(),
                                        endTime: void 0 === e.endTime ? void 0 : null === e.endTime ? null : e.endTime.toISOString(),
                                        visibility: e.visibility,
                                        groupId: e.groupId,
                                        placeId: e.placeId,
                                        categories: void 0 === e.categories ? void 0 : null === e.categories ? null : e.categories.map(c),
                                        thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(l),
                                        config: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                recurrence: e.recurrence,
                                                recurrenceEndTime: void 0 === e.recurrenceEndTime ? void 0 : null === e.recurrenceEndTime ? null : e.recurrenceEndTime.toISOString(),
                                                notificationAudience: e.notificationAudience
                                            }
                                        }(e.config),
                                        featuringStatus: e.featuringStatus,
                                        tagline: e.tagline
                                    }
                                }(e.gameEventsCreateRequest)
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return f(e)
                            })]
                    }
                })
            })
        }, n.prototype.gameEventsCreate = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventsCreateRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.gameEventsListRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling gameEventsList.");
                            return i = {}, void 0 !== e.pageSize && (i.pageSize = e.pageSize), void 0 !== e.pageToken && (i.pageToken = e.pageToken), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.startsBefore && (i.startsBefore = e.startsBefore.toISOString()), void 0 !== e.startsAfter && (i.startsAfter = e.startsAfter.toISOString()), void 0 !== e.endsBefore && (i.endsBefore = e.endsBefore.toISOString()), void 0 !== e.endsAfter && (i.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (i.visibility = e.visibility), void 0 !== e.fields && (i.fields = e.fields), r = {}, [4, this.request({
                                path: "/v3/universes/{universeId}/game-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v3/universes/{universeId}/game-events",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return null == e ? e : {
                                    gameEvents: (0, t.exists)(e, "gameEvents") ? null === e.gameEvents ? null : e.gameEvents.map(f) : void 0,
                                    nextPageToken: (0, t.exists)(e, "nextPageToken") ? e.nextPageToken : void 0,
                                    previousPageToken: (0, t.exists)(e, "previousPageToken") ? e.previousPageToken : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.gameEventsList = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.gameEventsListRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.notificationsUpdateNotificationsPreferencesRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/notifications/preferences",
                                schemaPath: "/v1/notifications/preferences",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        isEnabled: e.isEnabled
                                    }
                                }(e.notificationsUpdateNotificationsPreferencesRequest)
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u)]
                    }
                })
            })
        }, n.prototype.notificationsUpdateNotificationsPreferences = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.notificationsUpdateNotificationsPreferencesRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.notificationsUpdateUserModalHistoryRaw = function(e) {
            return r(this, void 0, void 0, function() {
                var n, i, r;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return n = {}, i = {}, [4, this.request({
                                path: "/v1/notifications/modal-history",
                                schemaPath: "/v1/notifications/modal-history",
                                method: "POST",
                                headers: i,
                                query: n
                            }, e)];
                        case 1:
                            return r = s.sent(), [2, new t.JSONApiResponse(r)]
                    }
                })
            })
        }, n.prototype.notificationsUpdateUserModalHistory = function(e) {
            return r(this, void 0, void 0, function() {
                return s(this, function(t) {
                    switch (t.label) {
                        case 0:
                            return [4, this.notificationsUpdateUserModalHistoryRaw(e)];
                        case 1:
                            return [4, t.sent().value()];
                        case 2:
                            return [2, t.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI),
    function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        i(n, e), n.prototype.rsvpGetRsvpCountersRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.RequiredError("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpGetRsvpCounters.");
                            return i = {}, r = {}, [4, this.request({
                                path: "/v1/virtual-events/{virtualEventId}/rsvps/counters".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps/counters",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                var n;
                                return null == e ? e : {
                                    counters: (0, t.exists)(e, "counters") ? null == (n = e.counters) ? n : {
                                        none: (0, t.exists)(n, "none") ? n.none : void 0,
                                        going: (0, t.exists)(n, "going") ? n.going : void 0,
                                        maybeGoing: (0, t.exists)(n, "maybeGoing") ? n.maybeGoing : void 0,
                                        notGoing: (0, t.exists)(n, "notGoing") ? n.notGoing : void 0
                                    } : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.rsvpGetRsvpCounters = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.rsvpGetRsvpCountersRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.rsvpGetUserRsvpedEventsRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return i = {}, void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                path: "/v1/my-rsvps",
                                schemaPath: "/v1/my-rsvps",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return E(e)
                            })]
                    }
                })
            })
        }, n.prototype.rsvpGetUserRsvpedEvents = function() {
            return r(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.rsvpGetUserRsvpedEventsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.rsvpGetVirtualEventRsvpsRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.RequiredError("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpGetVirtualEventRsvps.");
                            return i = {}, void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                path: "/v1/virtual-events/{virtualEventId}/rsvps".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps",
                                method: "GET",
                                headers: r,
                                query: i
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return null == e ? e : {
                                    nextPageCursor: (0, t.exists)(e, "nextPageCursor") ? e.nextPageCursor : void 0,
                                    previousPageCursor: (0, t.exists)(e, "previousPageCursor") ? e.previousPageCursor : void 0,
                                    data: (0, t.exists)(e, "data") ? null === e.data ? null : e.data.map(m) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.rsvpGetVirtualEventRsvps = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.rsvpGetVirtualEventRsvpsRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.rsvpRsvpToEventRaw = function(e, n) {
            return r(this, void 0, void 0, function() {
                var i, r, u;
                return s(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === e.virtualEventId || void 0 === e.virtualEventId) throw new t.RequiredError("virtualEventId", "Required parameter requestParameters.virtualEventId was null or undefined when calling rsvpRsvpToEvent.");
                            return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                path: "/v1/virtual-events/{virtualEventId}/rsvps".replace("{".concat("virtualEventId", "}"), encodeURIComponent(String(e.virtualEventId))),
                                schemaPath: "/v1/virtual-events/{virtualEventId}/rsvps",
                                method: "POST",
                                headers: r,
                                query: i,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        rsvpStatus: e.rsvpStatus
                                    }
                                }(e.rsvpRsvpToEventRequest)
                            }, n)];
                        case 1:
                            return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                return m(e)
                            })]
                    }
                })
            })
        }, n.prototype.rsvpRsvpToEvent = function(e, t) {
            return r(this, void 0, void 0, function() {
                return s(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.rsvpRsvpToEventRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    }(t.BaseAPI);
    var w = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.universesGetUniverseEventOccurrencesRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesGetUniverseEventOccurrences.");
                                return i = {}, void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/event-occurrences".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/event-occurrences",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, n.prototype.universesGetUniverseEventOccurrences = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.universesGetUniverseEventOccurrencesRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.universesGetUniverseVirtualEventsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesGetUniverseVirtualEvents.");
                                return i = {}, void 0 !== e.fromUtc && (i.fromUtc = e.fromUtc.toISOString()), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/universes/{universeId}/virtual-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universeId}/virtual-events",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, n.prototype.universesGetUniverseVirtualEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.universesGetUniverseVirtualEventsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        y = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.universesV2GetUniverseVirtualEventsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling universesV2GetUniverseVirtualEvents.");
                                return i = {}, void 0 !== e.startsBefore && (i.startsBefore = e.startsBefore.toISOString()), void 0 !== e.startsAfter && (i.startsAfter = e.startsAfter.toISOString()), void 0 !== e.endsBefore && (i.endsBefore = e.endsBefore.toISOString()), void 0 !== e.endsAfter && (i.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (i.visibility = e.visibility), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v2/universes/{universeId}/experience-events".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v2/universes/{universeId}/experience-events",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, n.prototype.universesV2GetUniverseVirtualEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.universesV2GetUniverseVirtualEventsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI),
        b = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(n, e), n.prototype.virtualEventsCreateVirtualEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/create",
                                    schemaPath: "/v1/virtual-events/create",
                                    method: "POST",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            title: e.title,
                                            subtitle: e.subtitle,
                                            description: e.description,
                                            eventTime: o(e.eventTime),
                                            universeId: e.universeId,
                                            placeId: e.placeId,
                                            groupId: e.groupId,
                                            eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(c),
                                            thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(l),
                                            visibility: e.visibility,
                                            tagline: e.tagline,
                                            featuringStatus: e.featuringStatus
                                        }
                                    }(e.virtualEventsCreateVirtualEventRequest)
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsCreateVirtualEvent = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsCreateVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsDeleteVirtualEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsDeleteVirtualEvent.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "DELETE",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return null == e ? e : {
                                        isDeleted: (0, t.exists)(e, "isDeleted") ? e.isDeleted : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsDeleteVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsDeleteVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetCreatorVirtualEventsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.groupId && (i.groupId = e.groupId), void 0 !== e.filterBy && (i.filterBy = e.filterBy), void 0 !== e.fromUtc && (i.fromUtc = e.fromUtc.toISOString()), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), void 0 !== e.sortBy && (i.sortBy = e.sortBy), void 0 !== e.sortOrder && (i.sortOrder = e.sortOrder), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/my-events",
                                    schemaPath: "/v1/virtual-events/my-events",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetCreatorVirtualEvents = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetCreatorVirtualEventsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetGroupExperienceEventsRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetGroupExperienceEvents.");
                                return i = {}, void 0 !== e.endsAfter && (i.endsAfter = e.endsAfter.toISOString()), void 0 !== e.visibility && (i.visibility = e.visibility), void 0 !== e.cursor && (i.cursor = e.cursor), void 0 !== e.reverse && (i.reverse = e.reverse), void 0 !== e.limit && (i.limit = e.limit), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/groups/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/groups/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return E(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetGroupExperienceEvents = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetGroupExperienceEventsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPermissionsForHostRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return i = {}, void 0 !== e.hostId && (i.hostId = e.hostId), void 0 !== e.hostType && (i.hostType = e.hostType), r = {}, [4, this.request({
                                    path: "/v1/virtual-events/permissions",
                                    schemaPath: "/v1/virtual-events/permissions",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return null == e ? e : {
                                        maxPermissionLevel: (0, t.exists)(e, "maxPermissionLevel") ? e.maxPermissionLevel : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPermissionsForHost = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetPermissionsForHostRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPublicVirtualEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetPublicVirtualEvent.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/public/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/public/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetPublicVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetPublicVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetVirtualEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsGetVirtualEvent.");
                                return i = {}, r = {}, [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "GET",
                                    headers: r,
                                    query: i
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsGetVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsGetVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEventRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsUpdateVirtualEvent.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}",
                                    method: "PATCH",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            title: e.title,
                                            subtitle: e.subtitle,
                                            description: e.description,
                                            eventTime: p(e.eventTime),
                                            universeId: e.universeId,
                                            placeId: e.placeId,
                                            visibility: e.visibility,
                                            eventCategories: void 0 === e.eventCategories ? void 0 : null === e.eventCategories ? null : e.eventCategories.map(c),
                                            thumbnails: void 0 === e.thumbnails ? void 0 : null === e.thumbnails ? null : e.thumbnails.map(l),
                                            tagline: e.tagline,
                                            featuringStatus: e.featuringStatus
                                        }
                                    }(e.virtualEventsUpdateVirtualEventRequest)
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return null == e ? e : {
                                        isUpdated: (0, t.exists)(e, "isUpdated") ? e.isUpdated : void 0,
                                        thumbnailsUpdated: (0, t.exists)(e, "thumbnailsUpdated") ? e.thumbnailsUpdated : void 0,
                                        categoriesUpdated: (0, t.exists)(e, "categoriesUpdated") ? e.categoriesUpdated : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEvent = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsUpdateVirtualEventRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEventStatusRaw = function(e, n) {
                return r(this, void 0, void 0, function() {
                    var i, r, u;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new t.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling virtualEventsUpdateVirtualEventStatus.");
                                return i = {}, (r = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/virtual-events/{id}/status".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/virtual-events/{id}/status",
                                    method: "PATCH",
                                    headers: r,
                                    query: i,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            eventStatus: e.eventStatus
                                        }
                                    }(e.virtualEventsUpdateVirtualEventStatusRequest)
                                }, n)];
                            case 1:
                                return u = s.sent(), [2, new t.JSONApiResponse(u, function(e) {
                                    return null == e ? e : {
                                        isUpdated: (0, t.exists)(e, "isUpdated") ? e.isUpdated : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.virtualEventsUpdateVirtualEventStatus = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.virtualEventsUpdateVirtualEventStatusRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, n
        }(t.BaseAPI);
    e.s(["EventCategory", 0, {
        ContentUpdate: "contentUpdate",
        LocationUpdate: "locationUpdate",
        SystemUpdate: "systemUpdate",
        Activity: "activity",
        NewContent: "newContent",
        ItemDrop: "itemDrop",
        NewSeason: "newSeason",
        NewLocation: "newLocation",
        NewMap: "newMap",
        MoreLevels: "moreLevels",
        NewFeature: "newFeature",
        EarlyAccess: "earlyAccess",
        Expansion: "expansion",
        Challenge: "challenge",
        Quest: "quest",
        Festival: "festival"
    }, "EventFilterBy", 0, {
        Upcoming: "upcoming",
        Past: "past",
        Drafts: "drafts",
        Cancelled: "cancelled"
    }, "EventSortBy", 0, {
        CreatedUtc: "createdUtc",
        StartUtc: "startUtc"
    }, "EventStatus", 0, {
        Unpublished: "unpublished",
        Active: "active",
        Cancelled: "cancelled",
        Moderated: "moderated"
    }, "EventVisibility", 0, {
        Private: "private",
        Public: "public",
        Moderated: "moderated"
    }, "FeaturingStatus", 0, {
        Invalid: "invalid",
        Enabled: "enabled",
        Disabled: "disabled"
    }, "HostType", 0, {
        User: "user",
        Group: "group"
    }, "SortOrder", 0, {
        Asc: "asc",
        Desc: "desc"
    }, "UniversesApi", 0, w, "UniversesV2Api", 0, y, "VirtualEventsApi", 0, b])
}]);

//# debugId=30e35277-35f6-0db3-55c2-ecce34eb4cde
//# sourceMappingURL=2fanqk2aldwuc.js.map