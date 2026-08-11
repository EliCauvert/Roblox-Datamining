; // bundle: leanbase___c2ac5da1ba63f77f28758aec88fab6cc_m
; // files: leancore/libs/bootstrap.min.js, leancore/BootstrapNamespacing.js, leancore/libs/underscore-min.js, GoogleAnalytics/GoogleAnalyticsEvents.js, RobloxEventManager.js, GoogleEventListener.js, utilities/deviceFeatureDetection.js, utilities/lazyLoad.js, utilities/urlParser.js, utilities/generalSubmitButton.js, DeveloperConsoleWarning.js, widgets/jquery.mCustomScrollbar.concat.min.js, Reference/widget.js, CookieUpgrader.js, leancore/RobloxBaseInit.js, common/robloxError.js, ~/Generated/js/Roblox_TranslationResources_CommonUI_ControlsResources_en_us_standard.js, Thumbnails/thumbnailMetrics.js, DisplayNames/DisplayNames.js, jquery.tipsy.js, extensions/string.js, StringTruncator.js, MasterPageUI.js, jquery.simplemodal-1.3.5.js, extensions/Thumbnails.js, CookieUpgrader.js, utilities/stringFormat.js, Tracking/SignupTrackingScript.js, Tracking/AsyncGoogleOnScript.js

; // leancore/libs/bootstrap.min.js
/*!
 * Bootstrap v3.3.5 (http://getbootstrap.com)
 * Copyright 2011-2015 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 */

/*!
 * Generated using the Bootstrap Customizer (http://getbootstrap.com/customize/?id=b8480475c6c7b955a207)
 * Config saved to config.json and https://gist.github.com/b8480475c6c7b955a207
 */
if ("undefined" == typeof jQuery) throw new Error("Bootstrap's JavaScript requires jQuery"); + function(t) {
    "use strict";
    var e = t.fn.jquery.split(" ")[0].split(".");
    if (e[0] < 2 && e[1] < 9 || 1 == e[0] && 9 == e[1] && e[2] < 1) throw new Error("Bootstrap's JavaScript requires jQuery version 1.9.1 or higher")
}(jQuery), + function(t) {
    "use strict";

    function e(e) {
        return this.each(function() {
            var i = t(this),
                n = i.data("bs.alert");
            n || i.data("bs.alert", n = new o(this)), "string" == typeof e && n[e].call(i)
        })
    }
    var i = '[data-dismiss="alert"]',
        o = function(e) {
            t(e).on("click", i, this.close)
        };
    o.VERSION = "3.3.5", o.TRANSITION_DURATION = 150, o.prototype.close = function(e) {
        function i() {
            a.detach().trigger("closed.bs.alert").remove()
        }
        var n = t(this),
            s = n.attr("data-target");
        s || (s = n.attr("href"), s = s && s.replace(/.*(?=#[^\s]*$)/, ""));
        var a = t(s);
        e && e.preventDefault(), a.length || (a = n.closest(".alert")), a.trigger(e = t.Event("close.bs.alert")), e.isDefaultPrevented() || (a.removeClass("in"), t.support.transition && a.hasClass("fade") ? a.one("bsTransitionEnd", i).emulateTransitionEnd(o.TRANSITION_DURATION) : i())
    };
    var n = t.fn.alert;
    t.fn.alert = e, t.fn.alert.Constructor = o, t.fn.alert.noConflict = function() {
        return t.fn.alert = n, this
    }, t(document).on("click.bs.alert.data-api", i, o.prototype.close)
}(jQuery), + function(t) {
    "use strict";

    function e(e) {
        return this.each(function() {
            var o = t(this),
                n = o.data("bs.button"),
                s = "object" == typeof e && e;
            n || o.data("bs.button", n = new i(this, s)), "toggle" == e ? n.toggle() : e && n.setState(e)
        })
    }
    var i = function(e, o) {
        this.$element = t(e), this.options = t.extend({}, i.DEFAULTS, o), this.isLoading = !1
    };
    i.VERSION = "3.3.5", i.DEFAULTS = {
        loadingText: "loading..."
    }, i.prototype.setState = function(e) {
        var i = "disabled",
            o = this.$element,
            n = o.is("input") ? "val" : "html",
            s = o.data();
        e += "Text", null == s.resetText && o.data("resetText", o[n]()), setTimeout(t.proxy(function() {
            o[n](null == s[e] ? this.options[e] : s[e]), "loadingText" == e ? (this.isLoading = !0, o.addClass(i).attr(i, i)) : this.isLoading && (this.isLoading = !1, o.removeClass(i).removeAttr(i))
        }, this), 0)
    }, i.prototype.toggle = function() {
        var t = !0,
            e = this.$element.closest('[data-toggle="buttons"]');
        if (e.length) {
            var i = this.$element.find("input");
            "radio" == i.prop("type") ? (i.prop("checked") && (t = !1), e.find(".active").removeClass("active"), this.$element.addClass("active")) : "checkbox" == i.prop("type") && (i.prop("checked") !== this.$element.hasClass("active") && (t = !1), this.$element.toggleClass("active")), i.prop("checked", this.$element.hasClass("active")), t && i.trigger("change")
        } else this.$element.attr("aria-pressed", !this.$element.hasClass("active")), this.$element.toggleClass("active")
    };
    var o = t.fn.button;
    t.fn.button = e, t.fn.button.Constructor = i, t.fn.button.noConflict = function() {
        return t.fn.button = o, this
    }, t(document).on("click.bs.button.data-api", '[data-toggle^="button"]', function(i) {
        var o = t(i.target);
        o.hasClass("btn") || (o = o.closest(".btn")), e.call(o, "toggle"), t(i.target).is('input[type="radio"]') || t(i.target).is('input[type="checkbox"]') || i.preventDefault()
    }).on("focus.bs.button.data-api blur.bs.button.data-api", '[data-toggle^="button"]', function(e) {
        t(e.target).closest(".btn").toggleClass("focus", /^focus(in)?$/.test(e.type))
    })
}(jQuery), + function(t) {
    "use strict";

    function e(e) {
        return this.each(function() {
            var o = t(this),
                n = o.data("bs.carousel"),
                s = t.extend({}, i.DEFAULTS, o.data(), "object" == typeof e && e),
                a = "string" == typeof e ? e : s.slide;
            n || o.data("bs.carousel", n = new i(this, s)), "number" == typeof e ? n.to(e) : a ? n[a]() : s.interval && n.pause().cycle()
        })
    }
    var i = function(e, i) {
        this.$element = t(e), this.$indicators = this.$element.find(".carousel-indicators"), this.options = i, this.paused = null, this.sliding = null, this.interval = null, this.$active = null, this.$items = null, this.options.keyboard && this.$element.on("keydown.bs.carousel", t.proxy(this.keydown, this)), "hover" == this.options.pause && !("ontouchstart" in document.documentElement) && this.$element.on("mouseenter.bs.carousel", t.proxy(this.pause, this)).on("mouseleave.bs.carousel", t.proxy(this.cycle, this))
    };
    i.VERSION = "3.3.5", i.TRANSITION_DURATION = 600, i.DEFAULTS = {
        interval: 5e3,
        pause: "hover",
        wrap: !0,
        keyboard: !0
    }, i.prototype.keydown = function(t) {
        if (!/input|textarea/i.test(t.target.tagName)) {
            switch (t.which) {
                case 37:
                    this.prev();
                    break;
                case 39:
                    this.next();
                    break;
                default:
                    return
            }
            t.preventDefault()
        }
    }, i.prototype.cycle = function(e) {
        return e || (this.paused = !1), this.interval && clearInterval(this.interval), this.options.interval && !this.paused && (this.interval = setInterval(t.proxy(this.next, this), this.options.interval)), this
    }, i.prototype.getItemIndex = function(t) {
        return this.$items = t.parent().children(".item"), this.$items.index(t || this.$active)
    }, i.prototype.getItemForDirection = function(t, e) {
        var i = this.getItemIndex(e),
            o = "prev" == t && 0 === i || "next" == t && i == this.$items.length - 1;
        if (o && !this.options.wrap) return e;
        var n = "prev" == t ? -1 : 1,
            s = (i + n) % this.$items.length;
        return this.$items.eq(s)
    }, i.prototype.to = function(t) {
        var e = this,
            i = this.getItemIndex(this.$active = this.$element.find(".item.active"));
        return t > this.$items.length - 1 || 0 > t ? void 0 : this.sliding ? this.$element.one("slid.bs.carousel", function() {
            e.to(t)
        }) : i == t ? this.pause().cycle() : this.slide(t > i ? "next" : "prev", this.$items.eq(t))
    }, i.prototype.pause = function(e) {
        return e || (this.paused = !0), this.$element.find(".next, .prev").length && t.support.transition && (this.$element.trigger(t.support.transition.end), this.cycle(!0)), this.interval = clearInterval(this.interval), this
    }, i.prototype.next = function() {
        return this.sliding ? void 0 : this.slide("next")
    }, i.prototype.prev = function() {
        return this.sliding ? void 0 : this.slide("prev")
    }, i.prototype.slide = function(e, o) {
        var n = this.$element.find(".item.active"),
            s = o || this.getItemForDirection(e, n),
            a = this.interval,
            r = "next" == e ? "left" : "right",
            l = this;
        if (s.hasClass("active")) return this.sliding = !1;
        var h = s[0],
            d = t.Event("slide.bs.carousel", {
                relatedTarget: h,
                direction: r
            });
        if (this.$element.trigger(d), !d.isDefaultPrevented()) {
            if (this.sliding = !0, a && this.pause(), this.$indicators.length) {
                this.$indicators.find(".active").removeClass("active");
                var p = t(this.$indicators.children()[this.getItemIndex(s)]);
                p && p.addClass("active")
            }
            var c = t.Event("slid.bs.carousel", {
                relatedTarget: h,
                direction: r
            });
            return t.support.transition && this.$element.hasClass("slide") ? (s.addClass(e), s[0].offsetWidth, n.addClass(r), s.addClass(r), n.one("bsTransitionEnd", function() {
                s.removeClass([e, r].join(" ")).addClass("active"), n.removeClass(["active", r].join(" ")), l.sliding = !1, setTimeout(function() {
                    l.$element.trigger(c)
                }, 0)
            }).emulateTransitionEnd(i.TRANSITION_DURATION)) : (n.removeClass("active"), s.addClass("active"), this.sliding = !1, this.$element.trigger(c)), a && this.cycle(), this
        }
    };
    var o = t.fn.carousel;
    t.fn.carousel = e, t.fn.carousel.Constructor = i, t.fn.carousel.noConflict = function() {
        return t.fn.carousel = o, this
    };
    var n = function(i) {
        var o, n = t(this),
            s = t(n.attr("data-target") || (o = n.attr("href")) && o.replace(/.*(?=#[^\s]+$)/, ""));
        if (s.hasClass("carousel")) {
            var a = t.extend({}, s.data(), n.data()),
                r = n.attr("data-slide-to");
            r && (a.interval = !1), e.call(s, a), r && s.data("bs.carousel").to(r), i.preventDefault()
        }
    };
    t(document).on("click.bs.carousel.data-api", "[data-slide]", n).on("click.bs.carousel.data-api", "[data-slide-to]", n), t(window).on("load", function() {
        t('[data-ride="carousel"]').each(function() {
            var i = t(this);
            e.call(i, i.data())
        })
    })
}(jQuery), + function(t) {
    "use strict";

    function e(e) {
        var i = e.attr("data-target");
        i || (i = e.attr("href"), i = i && /#[A-Za-z]/.test(i) && i.replace(/.*(?=#[^\s]*$)/, ""));
        var o = i && t(i);
        return o && o.length ? o : e.parent()
    }

    function i(i) {
        i && 3 === i.which || (t(n).remove(), t(s).each(function() {
            var o = t(this),
                n = e(o),
                s = {
                    relatedTarget: this
                };
            n.hasClass("open") && (i && "click" == i.type && /input|textarea/i.test(i.target.tagName) && t.contains(n[0], i.target) || (n.trigger(i = t.Event("hide.bs.dropdown", s)), i.isDefaultPrevented() || (o.attr("aria-expanded", "false"), n.removeClass("open").trigger("hidden.bs.dropdown", s))))
        }))
    }

    function o(e) {
        return this.each(function() {
            var i = t(this),
                o = i.data("bs.dropdown");
            o || i.data("bs.dropdown", o = new a(this)), "string" == typeof e && o[e].call(i)
        })
    }
    var n = ".dropdown-backdrop",
        s = '[data-toggle="dropdown"]',
        a = function(e) {
            t(e).on("click.bs.dropdown", this.toggle)
        };
    a.VERSION = "3.3.5", a.prototype.toggle = function(o) {
        var n = t(this);
        if (!n.is(".disabled, :disabled")) {
            var s = e(n),
                a = s.hasClass("open");
            if (i(), !a) {
                "ontouchstart" in document.documentElement && !s.closest(".navbar-nav").length && t(document.createElement("div")).addClass("dropdown-backdrop").insertAfter(t(this)).on("click", i);
                var r = {
                    relatedTarget: this
                };
                if (s.trigger(o = t.Event("show.bs.dropdown", r)), o.isDefaultPrevented()) return;
                n.trigger("focus").attr("aria-expanded", "true"), s.toggleClass("open").trigger("shown.bs.dropdown", r)
            }
            return !1
        }
    }, a.prototype.keydown = function(i) {
        if (/(38|40|27|32)/.test(i.which) && !/input|textarea/i.test(i.target.tagName)) {
            var o = t(this);
            if (i.preventDefault(), i.stopPropagation(), !o.is(".disabled, :disabled")) {
                var n = e(o),
                    a = n.hasClass("open");
                if (!a && 27 != i.which || a && 27 == i.which) return 27 == i.which && n.find(s).trigger("focus"), o.trigger("click");
                var r = " li:not(.disabled):visible a",
                    l = n.find(".dropdown-menu" + r);
                if (l.length) {
                    var h = l.index(i.target);
                    38 == i.which && h > 0 && h--, 40 == i.which && h < l.length - 1 && h++, ~h || (h = 0), l.eq(h).trigger("focus")
                }
            }
        }
    };
    var r = t.fn.dropdown;
    t.fn.dropdown = o, t.fn.dropdown.Constructor = a, t.fn.dropdown.noConflict = function() {
        return t.fn.dropdown = r, this
    }, t(document).on("click.bs.dropdown.data-api", i).on("click.bs.dropdown.data-api", ".dropdown form", function(t) {
        t.stopPropagation()
    }).on("click.bs.dropdown.data-api", s, a.prototype.toggle).on("keydown.bs.dropdown.data-api", s, a.prototype.keydown).on("keydown.bs.dropdown.data-api", ".dropdown-menu", a.prototype.keydown)
}(jQuery), + function(t) {
    "use strict";

    function e(e, o) {
        return this.each(function() {
            var n = t(this),
                s = n.data("bs.modal"),
                a = t.extend({}, i.DEFAULTS, n.data(), "object" == typeof e && e);
            s || n.data("bs.modal", s = new i(this, a)), "string" == typeof e ? s[e](o) : a.show && s.show(o)
        })
    }
    var i = function(e, i) {
        this.options = i, this.$body = t(document.body), this.$element = t(e), this.$dialog = this.$element.find(".modal-dialog"), this.$backdrop = null, this.isShown = null, this.originalBodyPad = null, this.scrollbarWidth = 0, this.ignoreBackdropClick = !1, this.options.remote && this.$element.find(".modal-content").load(this.options.remote, t.proxy(function() {
            this.$element.trigger("loaded.bs.modal")
        }, this))
    };
    i.VERSION = "3.3.5", i.TRANSITION_DURATION = 300, i.BACKDROP_TRANSITION_DURATION = 150, i.DEFAULTS = {
        backdrop: !0,
        keyboard: !0,
        show: !0
    }, i.prototype.toggle = function(t) {
        return this.isShown ? this.hide() : this.show(t)
    }, i.prototype.show = function(e) {
        var o = this,
            n = t.Event("show.bs.modal", {
                relatedTarget: e
            });
        this.$element.trigger(n), this.isShown || n.isDefaultPrevented() || (this.isShown = !0, this.checkScrollbar(), this.setScrollbar(), this.$body.addClass("modal-open"), this.escape(), this.resize(), this.$element.on("click.dismiss.bs.modal", '[data-dismiss="modal"]', t.proxy(this.hide, this)), this.$dialog.on("mousedown.dismiss.bs.modal", function() {
            o.$element.one("mouseup.dismiss.bs.modal", function(e) {
                t(e.target).is(o.$element) && (o.ignoreBackdropClick = !0)
            })
        }), this.backdrop(function() {
            var n = t.support.transition && o.$element.hasClass("fade");
            o.$element.parent().length || o.$element.appendTo(o.$body), o.$element.show().scrollTop(0), o.adjustDialog(), n && o.$element[0].offsetWidth, o.$element.addClass("in"), o.enforceFocus();
            var s = t.Event("shown.bs.modal", {
                relatedTarget: e
            });
            n ? o.$dialog.one("bsTransitionEnd", function() {
                o.$element.trigger("focus").trigger(s)
            }).emulateTransitionEnd(i.TRANSITION_DURATION) : o.$element.trigger("focus").trigger(s)
        }))
    }, i.prototype.hide = function(e) {
        e && e.preventDefault(), e = t.Event("hide.bs.modal"), this.$element.trigger(e), this.isShown && !e.isDefaultPrevented() && (this.isShown = !1, this.escape(), this.resize(), t(document).off("focusin.bs.modal"), this.$element.removeClass("in").off("click.dismiss.bs.modal").off("mouseup.dismiss.bs.modal"), this.$dialog.off("mousedown.dismiss.bs.modal"), t.support.transition && this.$element.hasClass("fade") ? this.$element.one("bsTransitionEnd", t.proxy(this.hideModal, this)).emulateTransitionEnd(i.TRANSITION_DURATION) : this.hideModal())
    }, i.prototype.enforceFocus = function() {
        t(document).off("focusin.bs.modal").on("focusin.bs.modal", t.proxy(function(t) {
            this.$element[0] === t.target || this.$element.has(t.target).length || this.$element.trigger("focus")
        }, this))
    }, i.prototype.escape = function() {
        this.isShown && this.options.keyboard ? this.$element.on("keydown.dismiss.bs.modal", t.proxy(function(t) {
            27 == t.which && this.hide()
        }, this)) : this.isShown || this.$element.off("keydown.dismiss.bs.modal")
    }, i.prototype.resize = function() {
        this.isShown ? t(window).on("resize.bs.modal", t.proxy(this.handleUpdate, this)) : t(window).off("resize.bs.modal")
    }, i.prototype.hideModal = function() {
        var t = this;
        this.$element.hide(), this.backdrop(function() {
            t.$body.removeClass("modal-open"), t.resetAdjustments(), t.resetScrollbar(), t.$element.trigger("hidden.bs.modal")
        })
    }, i.prototype.removeBackdrop = function() {
        this.$backdrop && this.$backdrop.remove(), this.$backdrop = null
    }, i.prototype.backdrop = function(e) {
        var o = this,
            n = this.$element.hasClass("fade") ? "fade" : "";
        if (this.isShown && this.options.backdrop) {
            var s = t.support.transition && n;
            if (this.$backdrop = t(document.createElement("div")).addClass("modal-backdrop " + n).appendTo(this.$body), this.$element.on("click.dismiss.bs.modal", t.proxy(function(t) {
                    return this.ignoreBackdropClick ? void(this.ignoreBackdropClick = !1) : void(t.target === t.currentTarget && ("static" == this.options.backdrop ? this.$element[0].focus() : this.hide()))
                }, this)), s && this.$backdrop[0].offsetWidth, this.$backdrop.addClass("in"), !e) return;
            s ? this.$backdrop.one("bsTransitionEnd", e).emulateTransitionEnd(i.BACKDROP_TRANSITION_DURATION) : e()
        } else if (!this.isShown && this.$backdrop) {
            this.$backdrop.removeClass("in");
            var a = function() {
                o.removeBackdrop(), e && e()
            };
            t.support.transition && this.$element.hasClass("fade") ? this.$backdrop.one("bsTransitionEnd", a).emulateTransitionEnd(i.BACKDROP_TRANSITION_DURATION) : a()
        } else e && e()
    }, i.prototype.handleUpdate = function() {
        this.adjustDialog()
    }, i.prototype.adjustDialog = function() {
        var t = this.$element[0].scrollHeight > document.documentElement.clientHeight;
        this.$element.css({
            paddingLeft: !this.bodyIsOverflowing && t ? this.scrollbarWidth : "",
            paddingRight: this.bodyIsOverflowing && !t ? this.scrollbarWidth : ""
        })
    }, i.prototype.resetAdjustments = function() {
        this.$element.css({
            paddingLeft: "",
            paddingRight: ""
        })
    }, i.prototype.checkScrollbar = function() {
        var t = window.innerWidth;
        if (!t) {
            var e = document.documentElement.getBoundingClientRect();
            t = e.right - Math.abs(e.left)
        }
        this.bodyIsOverflowing = document.body.clientWidth < t, this.scrollbarWidth = this.measureScrollbar()
    }, i.prototype.setScrollbar = function() {
        var t = parseInt(this.$body.css("padding-right") || 0, 10);
        this.originalBodyPad = document.body.style.paddingRight || "", this.bodyIsOverflowing && this.$body.css("padding-right", t + this.scrollbarWidth)
    }, i.prototype.resetScrollbar = function() {
        this.$body.css("padding-right", this.originalBodyPad)
    }, i.prototype.measureScrollbar = function() {
        var t = document.createElement("div");
        t.className = "modal-scrollbar-measure", this.$body.append(t);
        var e = t.offsetWidth - t.clientWidth;
        return this.$body[0].removeChild(t), e
    };
    var o = t.fn.modal;
    t.fn.modal = e, t.fn.modal.Constructor = i, t.fn.modal.noConflict = function() {
        return t.fn.modal = o, this
    }, t(document).on("click.bs.modal.data-api", '[data-toggle="modal"]', function(i) {
        var o = t(this),
            n = o.attr("href"),
            s = t(o.attr("data-target") || n && n.replace(/.*(?=#[^\s]+$)/, "")),
            a = s.data("bs.modal") ? "toggle" : t.extend({
                remote: !/#/.test(n) && n
            }, s.data(), o.data());
        o.is("a") && i.preventDefault(), s.one("show.bs.modal", function(t) {
            t.isDefaultPrevented() || s.one("hidden.bs.modal", function() {
                o.is(":visible") && o.trigger("focus")
            })
        }), e.call(s, a, this)
    })
}(jQuery), + function(t) {
    "use strict";

    function e(e) {
        return this.each(function() {
            var o = t(this),
                n = o.data("bs.tooltip"),
                s = "object" == typeof e && e;
            (n || !/destroy|hide/.test(e)) && (n || o.data("bs.tooltip", n = new i(this, s)), "string" == typeof e && n[e]())
        })
    }
    var i = function(t, e) {
        this.type = null, this.options = null, this.enabled = null, this.timeout = null, this.hoverState = null, this.$element = null, this.inState = null, this.init("tooltip", t, e)
    };
    i.VERSION = "3.3.5", i.TRANSITION_DURATION = 150, i.DEFAULTS = {
        animation: !0,
        placement: "top",
        selector: !1,
        template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
        trigger: "hover focus",
        title: "",
        delay: 0,
        html: !1,
        container: !1,
        viewport: {
            selector: "body",
            padding: 0
        }
    }, i.prototype.init = function(e, i, o) {
        if (this.enabled = !0, this.type = e, this.$element = t(i), this.options = this.getOptions(o), this.$viewport = this.options.viewport && t(t.isFunction(this.options.viewport) ? this.options.viewport.call(this, this.$element) : this.options.viewport.selector || this.options.viewport), this.inState = {
                click: !1,
                hover: !1,
                focus: !1
            }, this.$element[0] instanceof document.constructor && !this.options.selector) throw new Error("`selector` option must be specified when initializing " + this.type + " on the window.document object!");
        for (var n = this.options.trigger.split(" "), s = n.length; s--;) {
            var a = n[s];
            if ("click" == a) this.$element.on("click." + this.type, this.options.selector, t.proxy(this.toggle, this));
            else if ("manual" != a) {
                var r = "hover" == a ? "mouseenter" : "focusin",
                    l = "hover" == a ? "mouseleave" : "focusout";
                this.$element.on(r + "." + this.type, this.options.selector, t.proxy(this.enter, this)), this.$element.on(l + "." + this.type, this.options.selector, t.proxy(this.leave, this))
            }
        }
        this.options.selector ? this._options = t.extend({}, this.options, {
            trigger: "manual",
            selector: ""
        }) : this.fixTitle()
    }, i.prototype.getDefaults = function() {
        return i.DEFAULTS
    }, i.prototype.getOptions = function(e) {
        return e = t.extend({}, this.getDefaults(), this.$element.data(), e), e.delay && "number" == typeof e.delay && (e.delay = {
            show: e.delay,
            hide: e.delay
        }), e
    }, i.prototype.getDelegateOptions = function() {
        var e = {},
            i = this.getDefaults();
        return this._options && t.each(this._options, function(t, o) {
            i[t] != o && (e[t] = o)
        }), e
    }, i.prototype.enter = function(e) {
        var i = e instanceof this.constructor ? e : t(e.currentTarget).data("bs." + this.type);
        return i || (i = new this.constructor(e.currentTarget, this.getDelegateOptions()), t(e.currentTarget).data("bs." + this.type, i)), e instanceof t.Event && (i.inState["focusin" == e.type ? "focus" : "hover"] = !0), i.tip().hasClass("in") || "in" == i.hoverState ? void(i.hoverState = "in") : (clearTimeout(i.timeout), i.hoverState = "in", i.options.delay && i.options.delay.show ? void(i.timeout = setTimeout(function() {
            "in" == i.hoverState && i.show()
        }, i.options.delay.show)) : i.show())
    }, i.prototype.isInStateTrue = function() {
        for (var t in this.inState)
            if (this.inState[t]) return !0;
        return !1
    }, i.prototype.leave = function(e) {
        var i = e instanceof this.constructor ? e : t(e.currentTarget).data("bs." + this.type);
        return i || (i = new this.constructor(e.currentTarget, this.getDelegateOptions()), t(e.currentTarget).data("bs." + this.type, i)), e instanceof t.Event && (i.inState["focusout" == e.type ? "focus" : "hover"] = !1), i.isInStateTrue() ? void 0 : (clearTimeout(i.timeout), i.hoverState = "out", i.options.delay && i.options.delay.hide ? void(i.timeout = setTimeout(function() {
            "out" == i.hoverState && i.hide()
        }, i.options.delay.hide)) : i.hide())
    }, i.prototype.show = function() {
        var e = t.Event("show.bs." + this.type);
        if (this.hasContent() && this.enabled) {
            this.$element.trigger(e);
            var o = t.contains(this.$element[0].ownerDocument.documentElement, this.$element[0]);
            if (e.isDefaultPrevented() || !o) return;
            var n = this,
                s = this.tip(),
                a = this.getUID(this.type);
            this.setContent(), s.attr("id", a), this.$element.attr("aria-describedby", a), this.options.animation && s.addClass("fade");
            var r = "function" == typeof this.options.placement ? this.options.placement.call(this, s[0], this.$element[0]) : this.options.placement,
                l = /\s?auto?\s?/i,
                h = l.test(r);
            h && (r = r.replace(l, "") || "top"), s.detach().css({
                top: 0,
                left: 0,
                display: "block"
            }).addClass(r).data("bs." + this.type, this), this.options.container ? s.appendTo(this.options.container) : s.insertAfter(this.$element), this.$element.trigger("inserted.bs." + this.type);
            var d = this.getPosition(),
                p = s[0].offsetWidth,
                c = s[0].offsetHeight;
            if (h) {
                var f = r,
                    u = this.getPosition(this.$viewport);
                r = "bottom" == r && d.bottom + c > u.bottom ? "top" : "top" == r && d.top - c < u.top ? "bottom" : "right" == r && d.right + p > u.width ? "left" : "left" == r && d.left - p < u.left ? "right" : r, s.removeClass(f).addClass(r)
            }
            var g = this.getCalculatedOffset(r, d, p, c);
            this.applyPlacement(g, r);
            var m = function() {
                var t = n.hoverState;
                n.$element.trigger("shown.bs." + n.type), n.hoverState = null, "out" == t && n.leave(n)
            };
            t.support.transition && this.$tip.hasClass("fade") ? s.one("bsTransitionEnd", m).emulateTransitionEnd(i.TRANSITION_DURATION) : m()
        }
    }, i.prototype.applyPlacement = function(e, i) {
        var o = this.tip(),
            n = o[0].offsetWidth,
            s = o[0].offsetHeight,
            a = parseInt(o.css("margin-top"), 10),
            r = parseInt(o.css("margin-left"), 10);
        isNaN(a) && (a = 0), isNaN(r) && (r = 0), e.top += a, e.left += r, t.offset.setOffset(o[0], t.extend({
            using: function(t) {
                o.css({
                    top: Math.round(t.top),
                    left: Math.round(t.left)
                })
            }
        }, e), 0), o.addClass("in");
        var l = o[0].offsetWidth,
            h = o[0].offsetHeight;
        "top" == i && h != s && (e.top = e.top + s - h);
        var d = this.getViewportAdjustedDelta(i, e, l, h);
        d.left ? e.left += d.left : e.top += d.top;
        var p = /top|bottom/.test(i),
            c = p ? 2 * d.left - n + l : 2 * d.top - s + h,
            f = p ? "offsetWidth" : "offsetHeight";
        o.offset(e), this.replaceArrow(c, o[0][f], p)
    }, i.prototype.replaceArrow = function(t, e, i) {
        this.arrow().css(i ? "left" : "top", 50 * (1 - t / e) + "%").css(i ? "top" : "left", "")
    }, i.prototype.setContent = function() {
        var t = this.tip(),
            e = this.getTitle();
        t.find(".tooltip-inner")[this.options.html ? "html" : "text"](e), t.removeClass("fade in top bottom left right")
    }, i.prototype.hide = function(e) {
        function o() {
            "in" != n.hoverState && s.detach(), n.$element.removeAttr("aria-describedby").trigger("hidden.bs." + n.type), e && e()
        }
        var n = this,
            s = t(this.$tip),
            a = t.Event("hide.bs." + this.type);
        return this.$element.trigger(a), a.isDefaultPrevented() ? void 0 : (s.removeClass("in"), t.support.transition && s.hasClass("fade") ? s.one("bsTransitionEnd", o).emulateTransitionEnd(i.TRANSITION_DURATION) : o(), this.hoverState = null, this)
    }, i.prototype.fixTitle = function() {
        var t = this.$element;
        (t.attr("title") || "string" != typeof t.attr("data-original-title")) && t.attr("data-original-title", t.attr("title") || "").attr("title", "")
    }, i.prototype.hasContent = function() {
        return this.getTitle()
    }, i.prototype.getPosition = function(e) {
        e = e || this.$element;
        var i = e[0],
            o = "BODY" == i.tagName,
            n = i.getBoundingClientRect();
        null == n.width && (n = t.extend({}, n, {
            width: n.right - n.left,
            height: n.bottom - n.top
        }));
        var s = o ? {
                top: 0,
                left: 0
            } : e.offset(),
            a = {
                scroll: o ? document.documentElement.scrollTop || document.body.scrollTop : e.scrollTop()
            },
            r = o ? {
                width: t(window).width(),
                height: t(window).height()
            } : null;
        return t.extend({}, n, a, r, s)
    }, i.prototype.getCalculatedOffset = function(t, e, i, o) {
        return "bottom" == t ? {
            top: e.top + e.height,
            left: e.left + e.width / 2 - i / 2
        } : "top" == t ? {
            top: e.top - o,
            left: e.left + e.width / 2 - i / 2
        } : "left" == t ? {
            top: e.top + e.height / 2 - o / 2,
            left: e.left - i
        } : {
            top: e.top + e.height / 2 - o / 2,
            left: e.left + e.width
        }
    }, i.prototype.getViewportAdjustedDelta = function(t, e, i, o) {
        var n = {
            top: 0,
            left: 0
        };
        if (!this.$viewport) return n;
        var s = this.options.viewport && this.options.viewport.padding || 0,
            a = this.getPosition(this.$viewport);
        if (/right|left/.test(t)) {
            var r = e.top - s - a.scroll,
                l = e.top + s - a.scroll + o;
            r < a.top ? n.top = a.top - r : l > a.top + a.height && (n.top = a.top + a.height - l)
        } else {
            var h = e.left - s,
                d = e.left + s + i;
            h < a.left ? n.left = a.left - h : d > a.right && (n.left = a.left + a.width - d)
        }
        return n
    }, i.prototype.getTitle = function() {
        var t, e = this.$element,
            i = this.options;
        return t = e.attr("data-original-title") || ("function" == typeof i.title ? i.title.call(e[0]) : i.title)
    }, i.prototype.getUID = function(t) {
        do t += ~~(1e6 * Math.random()); while (document.getElementById(t));
        return t
    }, i.prototype.tip = function() {
        if (!this.$tip && (this.$tip = t(this.options.template), 1 != this.$tip.length)) throw new Error(this.type + " `template` option must consist of exactly 1 top-level element!");
        return this.$tip
    }, i.prototype.arrow = function() {
        return this.$arrow = this.$arrow || this.tip().find(".tooltip-arrow")
    }, i.prototype.enable = function() {
        this.enabled = !0
    }, i.prototype.disable = function() {
        this.enabled = !1
    }, i.prototype.toggleEnabled = function() {
        this.enabled = !this.enabled
    }, i.prototype.toggle = function(e) {
        var i = this;
        e && (i = t(e.currentTarget).data("bs." + this.type), i || (i = new this.constructor(e.currentTarget, this.getDelegateOptions()), t(e.currentTarget).data("bs." + this.type, i))), e ? (i.inState.click = !i.inState.click, i.isInStateTrue() ? i.enter(i) : i.leave(i)) : i.tip().hasClass("in") ? i.leave(i) : i.enter(i)
    }, i.prototype.destroy = function() {
        var t = this;
        clearTimeout(this.timeout), this.hide(function() {
            t.$element.off("." + t.type).removeData("bs." + t.type), t.$tip && t.$tip.detach(), t.$tip = null, t.$arrow = null, t.$viewport = null
        })
    };
    var o = t.fn.tooltip;
    t.fn.tooltip = e, t.fn.tooltip.Constructor = i, t.fn.tooltip.noConflict = function() {
        return t.fn.tooltip = o, this
    }
}(jQuery), + function(t) {
    "use strict";

    function e(e) {
        return this.each(function() {
            var o = t(this),
                n = o.data("bs.popover"),
                s = "object" == typeof e && e;
            (n || !/destroy|hide/.test(e)) && (n || o.data("bs.popover", n = new i(this, s)), "string" == typeof e && n[e]())
        })
    }
    var i = function(t, e) {
        this.init("popover", t, e)
    };
    if (!t.fn.tooltip) throw new Error("Popover requires tooltip.js");
    i.VERSION = "3.3.5", i.DEFAULTS = t.extend({}, t.fn.tooltip.Constructor.DEFAULTS, {
        placement: "right",
        trigger: "click",
        content: "",
        template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
    }), i.prototype = t.extend({}, t.fn.tooltip.Constructor.prototype), i.prototype.constructor = i, i.prototype.getDefaults = function() {
        return i.DEFAULTS
    }, i.prototype.setContent = function() {
        var t = this.tip(),
            e = this.getTitle(),
            i = this.getContent();
        t.find(".popover-title")[this.options.html ? "html" : "text"](e), t.find(".popover-content").children().detach().end()[this.options.html ? "string" == typeof i ? "html" : "append" : "text"](i), t.removeClass("fade top bottom left right in"), t.find(".popover-title").html() || t.find(".popover-title").hide()
    }, i.prototype.hasContent = function() {
        return this.getTitle() || this.getContent()
    }, i.prototype.getContent = function() {
        var t = this.$element,
            e = this.options;
        return t.attr("data-content") || ("function" == typeof e.content ? e.content.call(t[0]) : e.content)
    }, i.prototype.arrow = function() {
        return this.$arrow = this.$arrow || this.tip().find(".arrow")
    };
    var o = t.fn.popover;
    t.fn.popover = e, t.fn.popover.Constructor = i, t.fn.popover.noConflict = function() {
        return t.fn.popover = o, this
    }
}(jQuery), + function(t) {
    "use strict";

    function e(e) {
        return this.each(function() {
            var o = t(this),
                n = o.data("bs.tab");
            n || o.data("bs.tab", n = new i(this)), "string" == typeof e && n[e]()
        })
    }
    var i = function(e) {
        this.element = t(e)
    };
    i.VERSION = "3.3.5", i.TRANSITION_DURATION = 150, i.prototype.show = function() {
        var e = this.element,
            i = e.closest("ul:not(.dropdown-menu)"),
            o = e.data("target");
        if (o || (o = e.attr("href"), o = o && o.replace(/.*(?=#[^\s]*$)/, "")), !e.parent("li").hasClass("active")) {
            var n = i.find(".active:last a"),
                s = t.Event("hide.bs.tab", {
                    relatedTarget: e[0]
                }),
                a = t.Event("show.bs.tab", {
                    relatedTarget: n[0]
                });
            if (n.trigger(s), e.trigger(a), !a.isDefaultPrevented() && !s.isDefaultPrevented()) {
                var r = t(o);
                this.activate(e.closest("li"), i), this.activate(r, r.parent(), function() {
                    n.trigger({
                        type: "hidden.bs.tab",
                        relatedTarget: e[0]
                    }), e.trigger({
                        type: "shown.bs.tab",
                        relatedTarget: n[0]
                    })
                })
            }
        }
    }, i.prototype.activate = function(e, o, n) {
        function s() {
            a.removeClass("active").find("> .dropdown-menu > .active").removeClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded", !1), e.addClass("active").find('[data-toggle="tab"]').attr("aria-expanded", !0), r ? (e[0].offsetWidth, e.addClass("in")) : e.removeClass("fade"), e.parent(".dropdown-menu").length && e.closest("li.dropdown").addClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded", !0), n && n()
        }
        var a = o.find("> .active"),
            r = n && t.support.transition && (a.length && a.hasClass("fade") || !!o.find("> .fade").length);
        a.length && r ? a.one("bsTransitionEnd", s).emulateTransitionEnd(i.TRANSITION_DURATION) : s(), a.removeClass("in")
    };
    var o = t.fn.tab;
    t.fn.tab = e, t.fn.tab.Constructor = i, t.fn.tab.noConflict = function() {
        return t.fn.tab = o, this
    };
    var n = function(i) {
        i.preventDefault(), e.call(t(this), "show")
    };
    t(document).on("click.bs.tab.data-api", '[data-toggle="tab"]', n).on("click.bs.tab.data-api", '[data-toggle="pill"]', n)
}(jQuery), + function(t) {
    "use strict";

    function e(e) {
        return this.each(function() {
            var o = t(this),
                n = o.data("bs.affix"),
                s = "object" == typeof e && e;
            n || o.data("bs.affix", n = new i(this, s)), "string" == typeof e && n[e]()
        })
    }
    var i = function(e, o) {
        this.options = t.extend({}, i.DEFAULTS, o), this.$target = t(this.options.target).on("scroll.bs.affix.data-api", t.proxy(this.checkPosition, this)).on("click.bs.affix.data-api", t.proxy(this.checkPositionWithEventLoop, this)), this.$element = t(e), this.affixed = null, this.unpin = null, this.pinnedOffset = null, this.checkPosition()
    };
    i.VERSION = "3.3.5", i.RESET = "affix affix-top affix-bottom", i.DEFAULTS = {
        offset: 0,
        target: window
    }, i.prototype.getState = function(t, e, i, o) {
        var n = this.$target.scrollTop(),
            s = this.$element.offset(),
            a = this.$target.height();
        if (null != i && "top" == this.affixed) return i > n ? "top" : !1;
        if ("bottom" == this.affixed) return null != i ? n + this.unpin <= s.top ? !1 : "bottom" : t - o >= n + a ? !1 : "bottom";
        var r = null == this.affixed,
            l = r ? n : s.top,
            h = r ? a : e;
        return null != i && i >= n ? "top" : null != o && l + h >= t - o ? "bottom" : !1
    }, i.prototype.getPinnedOffset = function() {
        if (this.pinnedOffset) return this.pinnedOffset;
        this.$element.removeClass(i.RESET).addClass("affix");
        var t = this.$target.scrollTop(),
            e = this.$element.offset();
        return this.pinnedOffset = e.top - t
    }, i.prototype.checkPositionWithEventLoop = function() {
        setTimeout(t.proxy(this.checkPosition, this), 1)
    }, i.prototype.checkPosition = function() {
        if (this.$element.is(":visible")) {
            var e = this.$element.height(),
                o = this.options.offset,
                n = o.top,
                s = o.bottom,
                a = Math.max(t(document).height(), t(document.body).height());
            "object" != typeof o && (s = n = o), "function" == typeof n && (n = o.top(this.$element)), "function" == typeof s && (s = o.bottom(this.$element));
            var r = this.getState(a, e, n, s);
            if (this.affixed != r) {
                null != this.unpin && this.$element.css("top", "");
                var l = "affix" + (r ? "-" + r : ""),
                    h = t.Event(l + ".bs.affix");
                if (this.$element.trigger(h), h.isDefaultPrevented()) return;
                this.affixed = r, this.unpin = "bottom" == r ? this.getPinnedOffset() : null, this.$element.removeClass(i.RESET).addClass(l).trigger(l.replace("affix", "affixed") + ".bs.affix")
            }
            "bottom" == r && this.$element.offset({
                top: a - e - s
            })
        }
    };
    var o = t.fn.affix;
    t.fn.affix = e, t.fn.affix.Constructor = i, t.fn.affix.noConflict = function() {
        return t.fn.affix = o, this
    }, t(window).on("load", function() {
        t('[data-spy="affix"]').each(function() {
            var i = t(this),
                o = i.data();
            o.offset = o.offset || {}, null != o.offsetBottom && (o.offset.bottom = o.offsetBottom), null != o.offsetTop && (o.offset.top = o.offsetTop), e.call(i, o)
        })
    })
}(jQuery), + function(t) {
    "use strict";

    function e(e) {
        var i, o = e.attr("data-target") || (i = e.attr("href")) && i.replace(/.*(?=#[^\s]+$)/, "");
        return t(o)
    }

    function i(e) {
        return this.each(function() {
            var i = t(this),
                n = i.data("bs.collapse"),
                s = t.extend({}, o.DEFAULTS, i.data(), "object" == typeof e && e);
            !n && s.toggle && /show|hide/.test(e) && (s.toggle = !1), n || i.data("bs.collapse", n = new o(this, s)), "string" == typeof e && n[e]()
        })
    }
    var o = function(e, i) {
        this.$element = t(e), this.options = t.extend({}, o.DEFAULTS, i), this.$trigger = t('[data-toggle="collapse"][href="#' + e.id + '"],[data-toggle="collapse"][data-target="#' + e.id + '"]'), this.transitioning = null, this.options.parent ? this.$parent = this.getParent() : this.addAriaAndCollapsedClass(this.$element, this.$trigger), this.options.toggle && this.toggle()
    };
    o.VERSION = "3.3.5", o.TRANSITION_DURATION = 350, o.DEFAULTS = {
        toggle: !0
    }, o.prototype.dimension = function() {
        var t = this.$element.hasClass("width");
        return t ? "width" : "height"
    }, o.prototype.show = function() {
        if (!this.transitioning && !this.$element.hasClass("in")) {
            var e, n = this.$parent && this.$parent.children(".panel").children(".in, .collapsing");
            if (!(n && n.length && (e = n.data("bs.collapse"), e && e.transitioning))) {
                var s = t.Event("show.bs.collapse");
                if (this.$element.trigger(s), !s.isDefaultPrevented()) {
                    n && n.length && (i.call(n, "hide"), e || n.data("bs.collapse", null));
                    var a = this.dimension();
                    this.$element.removeClass("collapse").addClass("collapsing")[a](0).attr("aria-expanded", !0), this.$trigger.removeClass("collapsed").attr("aria-expanded", !0), this.transitioning = 1;
                    var r = function() {
                        this.$element.removeClass("collapsing").addClass("collapse in")[a](""), this.transitioning = 0, this.$element.trigger("shown.bs.collapse")
                    };
                    if (!t.support.transition) return r.call(this);
                    var l = t.camelCase(["scroll", a].join("-"));
                    this.$element.one("bsTransitionEnd", t.proxy(r, this)).emulateTransitionEnd(o.TRANSITION_DURATION)[a](this.$element[0][l]);
                }
            }
        }
    }, o.prototype.hide = function() {
        if (!this.transitioning && this.$element.hasClass("in")) {
            var e = t.Event("hide.bs.collapse");
            if (this.$element.trigger(e), !e.isDefaultPrevented()) {
                var i = this.dimension();
                this.$element[i](this.$element[i]())[0].offsetHeight, this.$element.addClass("collapsing").removeClass("collapse in").attr("aria-expanded", !1), this.$trigger.addClass("collapsed").attr("aria-expanded", !1), this.transitioning = 1;
                var n = function() {
                    this.transitioning = 0, this.$element.removeClass("collapsing").addClass("collapse").trigger("hidden.bs.collapse")
                };
                return t.support.transition ? void this.$element[i](0).one("bsTransitionEnd", t.proxy(n, this)).emulateTransitionEnd(o.TRANSITION_DURATION) : n.call(this)
            }
        }
    }, o.prototype.toggle = function() {
        this[this.$element.hasClass("in") ? "hide" : "show"]()
    }, o.prototype.getParent = function() {
        return t(this.options.parent).find('[data-toggle="collapse"][data-parent="' + this.options.parent + '"]').each(t.proxy(function(i, o) {
            var n = t(o);
            this.addAriaAndCollapsedClass(e(n), n)
        }, this)).end()
    }, o.prototype.addAriaAndCollapsedClass = function(t, e) {
        var i = t.hasClass("in");
        t.attr("aria-expanded", i), e.toggleClass("collapsed", !i).attr("aria-expanded", i)
    };
    var n = t.fn.collapse;
    t.fn.collapse = i, t.fn.collapse.Constructor = o, t.fn.collapse.noConflict = function() {
        return t.fn.collapse = n, this
    }, t(document).on("click.bs.collapse.data-api", '[data-toggle="collapse"]', function(o) {
        var n = t(this);
        n.attr("data-target") || o.preventDefault();
        var s = e(n),
            a = s.data("bs.collapse"),
            r = a ? "toggle" : n.data();
        i.call(s, r)
    })
}(jQuery), + function(t) {
    "use strict";

    function e(i, o) {
        this.$body = t(document.body), this.$scrollElement = t(t(i).is(document.body) ? window : i), this.options = t.extend({}, e.DEFAULTS, o), this.selector = (this.options.target || "") + " .nav li > a", this.offsets = [], this.targets = [], this.activeTarget = null, this.scrollHeight = 0, this.$scrollElement.on("scroll.bs.scrollspy", t.proxy(this.process, this)), this.refresh(), this.process()
    }

    function i(i) {
        return this.each(function() {
            var o = t(this),
                n = o.data("bs.scrollspy"),
                s = "object" == typeof i && i;
            n || o.data("bs.scrollspy", n = new e(this, s)), "string" == typeof i && n[i]()
        })
    }
    e.VERSION = "3.3.5", e.DEFAULTS = {
        offset: 10
    }, e.prototype.getScrollHeight = function() {
        return this.$scrollElement[0].scrollHeight || Math.max(this.$body[0].scrollHeight, document.documentElement.scrollHeight)
    }, e.prototype.refresh = function() {
        var e = this,
            i = "offset",
            o = 0;
        this.offsets = [], this.targets = [], this.scrollHeight = this.getScrollHeight(), t.isWindow(this.$scrollElement[0]) || (i = "position", o = this.$scrollElement.scrollTop()), this.$body.find(this.selector).map(function() {
            var e = t(this),
                n = e.data("target") || e.attr("href"),
                s = /^#./.test(n) && t(n);
            return s && s.length && s.is(":visible") && [
                [s[i]().top + o, n]
            ] || null
        }).sort(function(t, e) {
            return t[0] - e[0]
        }).each(function() {
            e.offsets.push(this[0]), e.targets.push(this[1])
        })
    }, e.prototype.process = function() {
        var t, e = this.$scrollElement.scrollTop() + this.options.offset,
            i = this.getScrollHeight(),
            o = this.options.offset + i - this.$scrollElement.height(),
            n = this.offsets,
            s = this.targets,
            a = this.activeTarget;
        if (this.scrollHeight != i && this.refresh(), e >= o) return a != (t = s[s.length - 1]) && this.activate(t);
        if (a && e < n[0]) return this.activeTarget = null, this.clear();
        for (t = n.length; t--;) a != s[t] && e >= n[t] && (void 0 === n[t + 1] || e < n[t + 1]) && this.activate(s[t])
    }, e.prototype.activate = function(e) {
        this.activeTarget = e, this.clear();
        var i = this.selector + '[data-target="' + e + '"],' + this.selector + '[href="' + e + '"]',
            o = t(i).parents("li").addClass("active");
        o.parent(".dropdown-menu").length && (o = o.closest("li.dropdown").addClass("active")), o.trigger("activate.bs.scrollspy")
    }, e.prototype.clear = function() {
        t(this.selector).parentsUntil(this.options.target, ".active").removeClass("active")
    };
    var o = t.fn.scrollspy;
    t.fn.scrollspy = i, t.fn.scrollspy.Constructor = e, t.fn.scrollspy.noConflict = function() {
        return t.fn.scrollspy = o, this
    }, t(window).on("load.bs.scrollspy.data-api", function() {
        t('[data-spy="scroll"]').each(function() {
            var e = t(this);
            i.call(e, e.data())
        })
    })
}(jQuery), + function(t) {
    "use strict";

    function e() {
        var t = document.createElement("bootstrap"),
            e = {
                WebkitTransition: "webkitTransitionEnd",
                MozTransition: "transitionend",
                OTransition: "oTransitionEnd otransitionend",
                transition: "transitionend"
            };
        for (var i in e)
            if (void 0 !== t.style[i]) return {
                end: e[i]
            };
        return !1
    }
    t.fn.emulateTransitionEnd = function(e) {
        var i = !1,
            o = this;
        t(this).one("bsTransitionEnd", function() {
            i = !0
        });
        var n = function() {
            i || t(o).trigger(t.support.transition.end)
        };
        return setTimeout(n, e), this
    }, t(function() {
        t.support.transition = e(), t.support.transition && (t.event.special.bsTransitionEnd = {
            bindType: t.support.transition.end,
            delegateType: t.support.transition.end,
            handle: function(e) {
                return t(e.target).is(this) ? e.handleObj.handler.apply(this, arguments) : void 0
            }
        })
    })
}(jQuery);

; // leancore/BootstrapNamespacing.js
$.fn.bootstrapModal = $.fn.modal;

; // leancore/libs/underscore-min.js
(function() {
    function n(n) {
        function t(t, r, e, u, i, o) {
            for (; i >= 0 && o > i; i += n) {
                var a = u ? u[i] : i;
                e = r(e, t[a], a, t)
            }
            return e
        }
        return function(r, e, u, i) {
            e = b(e, i, 4);
            var o = !k(r) && m.keys(r),
                a = (o || r).length,
                c = n > 0 ? 0 : a - 1;
            return arguments.length < 3 && (u = r[o ? o[c] : c], c += n), t(r, e, u, o, c, a)
        }
    }

    function t(n) {
        return function(t, r, e) {
            r = x(r, e);
            for (var u = O(t), i = n > 0 ? 0 : u - 1; i >= 0 && u > i; i += n)
                if (r(t[i], i, t)) return i;
            return -1
        }
    }

    function r(n, t, r) {
        return function(e, u, i) {
            var o = 0,
                a = O(e);
            if ("number" == typeof i) n > 0 ? o = i >= 0 ? i : Math.max(i + a, o) : a = i >= 0 ? Math.min(i + 1, a) : i + a + 1;
            else if (r && i && a) return i = r(e, u), e[i] === u ? i : -1;
            if (u !== u) return i = t(l.call(e, o, a), m.isNaN), i >= 0 ? i + o : -1;
            for (i = n > 0 ? o : a - 1; i >= 0 && a > i; i += n)
                if (e[i] === u) return i;
            return -1
        }
    }

    function e(n, t) {
        var r = I.length,
            e = n.constructor,
            u = m.isFunction(e) && e.prototype || a,
            i = "constructor";
        for (m.has(n, i) && !m.contains(t, i) && t.push(i); r--;) i = I[r], i in n && n[i] !== u[i] && !m.contains(t, i) && t.push(i)
    }
    var u = this,
        i = u._,
        o = Array.prototype,
        a = Object.prototype,
        c = Function.prototype,
        f = o.push,
        l = o.slice,
        s = a.toString,
        p = a.hasOwnProperty,
        h = Array.isArray,
        v = Object.keys,
        g = c.bind,
        y = Object.create,
        d = function() {},
        m = function(n) {
            return n instanceof m ? n : this instanceof m ? void(this._wrapped = n) : new m(n)
        };
    "undefined" != typeof exports ? ("undefined" != typeof module && module.exports && (exports = module.exports = m), exports._ = m) : u._ = m, m.VERSION = "1.8.3";
    var b = function(n, t, r) {
            if (t === void 0) return n;
            switch (null == r ? 3 : r) {
                case 1:
                    return function(r) {
                        return n.call(t, r)
                    };
                case 2:
                    return function(r, e) {
                        return n.call(t, r, e)
                    };
                case 3:
                    return function(r, e, u) {
                        return n.call(t, r, e, u)
                    };
                case 4:
                    return function(r, e, u, i) {
                        return n.call(t, r, e, u, i)
                    }
            }
            return function() {
                return n.apply(t, arguments)
            }
        },
        x = function(n, t, r) {
            return null == n ? m.identity : m.isFunction(n) ? b(n, t, r) : m.isObject(n) ? m.matcher(n) : m.property(n)
        };
    m.iteratee = function(n, t) {
        return x(n, t, 1 / 0)
    };
    var _ = function(n, t) {
            return function(r) {
                var e = arguments.length;
                if (2 > e || null == r) return r;
                for (var u = 1; e > u; u++)
                    for (var i = arguments[u], o = n(i), a = o.length, c = 0; a > c; c++) {
                        var f = o[c];
                        t && r[f] !== void 0 || (r[f] = i[f])
                    }
                return r
            }
        },
        j = function(n) {
            if (!m.isObject(n)) return {};
            if (y) return y(n);
            d.prototype = n;
            var t = new d;
            return d.prototype = null, t
        },
        w = function(n) {
            return function(t) {
                return null == t ? void 0 : t[n]
            }
        },
        A = Math.pow(2, 53) - 1,
        O = w("length"),
        k = function(n) {
            var t = O(n);
            return "number" == typeof t && t >= 0 && A >= t
        };
    m.each = m.forEach = function(n, t, r) {
        t = b(t, r);
        var e, u;
        if (k(n))
            for (e = 0, u = n.length; u > e; e++) t(n[e], e, n);
        else {
            var i = m.keys(n);
            for (e = 0, u = i.length; u > e; e++) t(n[i[e]], i[e], n)
        }
        return n
    }, m.map = m.collect = function(n, t, r) {
        t = x(t, r);
        for (var e = !k(n) && m.keys(n), u = (e || n).length, i = Array(u), o = 0; u > o; o++) {
            var a = e ? e[o] : o;
            i[o] = t(n[a], a, n)
        }
        return i
    }, m.reduce = m.foldl = m.inject = n(1), m.reduceRight = m.foldr = n(-1), m.find = m.detect = function(n, t, r) {
        var e;
        return e = k(n) ? m.findIndex(n, t, r) : m.findKey(n, t, r), e !== void 0 && e !== -1 ? n[e] : void 0
    }, m.filter = m.select = function(n, t, r) {
        var e = [];
        return t = x(t, r), m.each(n, function(n, r, u) {
            t(n, r, u) && e.push(n)
        }), e
    }, m.reject = function(n, t, r) {
        return m.filter(n, m.negate(x(t)), r)
    }, m.every = m.all = function(n, t, r) {
        t = x(t, r);
        for (var e = !k(n) && m.keys(n), u = (e || n).length, i = 0; u > i; i++) {
            var o = e ? e[i] : i;
            if (!t(n[o], o, n)) return !1
        }
        return !0
    }, m.some = m.any = function(n, t, r) {
        t = x(t, r);
        for (var e = !k(n) && m.keys(n), u = (e || n).length, i = 0; u > i; i++) {
            var o = e ? e[i] : i;
            if (t(n[o], o, n)) return !0
        }
        return !1
    }, m.contains = m.includes = m.include = function(n, t, r, e) {
        return k(n) || (n = m.values(n)), ("number" != typeof r || e) && (r = 0), m.indexOf(n, t, r) >= 0
    }, m.invoke = function(n, t) {
        var r = l.call(arguments, 2),
            e = m.isFunction(t);
        return m.map(n, function(n) {
            var u = e ? t : n[t];
            return null == u ? u : u.apply(n, r)
        })
    }, m.pluck = function(n, t) {
        return m.map(n, m.property(t))
    }, m.where = function(n, t) {
        return m.filter(n, m.matcher(t))
    }, m.findWhere = function(n, t) {
        return m.find(n, m.matcher(t))
    }, m.max = function(n, t, r) {
        var e, u, i = -1 / 0,
            o = -1 / 0;
        if (null == t && null != n) {
            n = k(n) ? n : m.values(n);
            for (var a = 0, c = n.length; c > a; a++) e = n[a], e > i && (i = e)
        } else t = x(t, r), m.each(n, function(n, r, e) {
            u = t(n, r, e), (u > o || u === -1 / 0 && i === -1 / 0) && (i = n, o = u)
        });
        return i
    }, m.min = function(n, t, r) {
        var e, u, i = 1 / 0,
            o = 1 / 0;
        if (null == t && null != n) {
            n = k(n) ? n : m.values(n);
            for (var a = 0, c = n.length; c > a; a++) e = n[a], i > e && (i = e)
        } else t = x(t, r), m.each(n, function(n, r, e) {
            u = t(n, r, e), (o > u || 1 / 0 === u && 1 / 0 === i) && (i = n, o = u)
        });
        return i
    }, m.shuffle = function(n) {
        for (var t, r = k(n) ? n : m.values(n), e = r.length, u = Array(e), i = 0; e > i; i++) t = m.random(0, i), t !== i && (u[i] = u[t]), u[t] = r[i];
        return u
    }, m.sample = function(n, t, r) {
        return null == t || r ? (k(n) || (n = m.values(n)), n[m.random(n.length - 1)]) : m.shuffle(n).slice(0, Math.max(0, t))
    }, m.sortBy = function(n, t, r) {
        return t = x(t, r), m.pluck(m.map(n, function(n, r, e) {
            return {
                value: n,
                index: r,
                criteria: t(n, r, e)
            }
        }).sort(function(n, t) {
            var r = n.criteria,
                e = t.criteria;
            if (r !== e) {
                if (r > e || r === void 0) return 1;
                if (e > r || e === void 0) return -1
            }
            return n.index - t.index
        }), "value")
    };
    var F = function(n) {
        return function(t, r, e) {
            var u = {};
            return r = x(r, e), m.each(t, function(e, i) {
                var o = r(e, i, t);
                n(u, e, o)
            }), u
        }
    };
    m.groupBy = F(function(n, t, r) {
        m.has(n, r) ? n[r].push(t) : n[r] = [t]
    }), m.indexBy = F(function(n, t, r) {
        n[r] = t
    }), m.countBy = F(function(n, t, r) {
        m.has(n, r) ? n[r]++ : n[r] = 1
    }), m.toArray = function(n) {
        return n ? m.isArray(n) ? l.call(n) : k(n) ? m.map(n, m.identity) : m.values(n) : []
    }, m.size = function(n) {
        return null == n ? 0 : k(n) ? n.length : m.keys(n).length
    }, m.partition = function(n, t, r) {
        t = x(t, r);
        var e = [],
            u = [];
        return m.each(n, function(n, r, i) {
            (t(n, r, i) ? e : u).push(n)
        }), [e, u]
    }, m.first = m.head = m.take = function(n, t, r) {
        return null == n ? void 0 : null == t || r ? n[0] : m.initial(n, n.length - t)
    }, m.initial = function(n, t, r) {
        return l.call(n, 0, Math.max(0, n.length - (null == t || r ? 1 : t)))
    }, m.last = function(n, t, r) {
        return null == n ? void 0 : null == t || r ? n[n.length - 1] : m.rest(n, Math.max(0, n.length - t))
    }, m.rest = m.tail = m.drop = function(n, t, r) {
        return l.call(n, null == t || r ? 1 : t)
    }, m.compact = function(n) {
        return m.filter(n, m.identity)
    };
    var S = function(n, t, r, e) {
        for (var u = [], i = 0, o = e || 0, a = O(n); a > o; o++) {
            var c = n[o];
            if (k(c) && (m.isArray(c) || m.isArguments(c))) {
                t || (c = S(c, t, r));
                var f = 0,
                    l = c.length;
                for (u.length += l; l > f;) u[i++] = c[f++]
            } else r || (u[i++] = c)
        }
        return u
    };
    m.flatten = function(n, t) {
        return S(n, t, !1)
    }, m.without = function(n) {
        return m.difference(n, l.call(arguments, 1))
    }, m.uniq = m.unique = function(n, t, r, e) {
        m.isBoolean(t) || (e = r, r = t, t = !1), null != r && (r = x(r, e));
        for (var u = [], i = [], o = 0, a = O(n); a > o; o++) {
            var c = n[o],
                f = r ? r(c, o, n) : c;
            t ? (o && i === f || u.push(c), i = f) : r ? m.contains(i, f) || (i.push(f), u.push(c)) : m.contains(u, c) || u.push(c)
        }
        return u
    }, m.union = function() {
        return m.uniq(S(arguments, !0, !0))
    }, m.intersection = function(n) {
        for (var t = [], r = arguments.length, e = 0, u = O(n); u > e; e++) {
            var i = n[e];
            if (!m.contains(t, i)) {
                for (var o = 1; r > o && m.contains(arguments[o], i); o++);
                o === r && t.push(i)
            }
        }
        return t
    }, m.difference = function(n) {
        var t = S(arguments, !0, !0, 1);
        return m.filter(n, function(n) {
            return !m.contains(t, n)
        })
    }, m.zip = function() {
        return m.unzip(arguments)
    }, m.unzip = function(n) {
        for (var t = n && m.max(n, O).length || 0, r = Array(t), e = 0; t > e; e++) r[e] = m.pluck(n, e);
        return r
    }, m.object = function(n, t) {
        for (var r = {}, e = 0, u = O(n); u > e; e++) t ? r[n[e]] = t[e] : r[n[e][0]] = n[e][1];
        return r
    }, m.findIndex = t(1), m.findLastIndex = t(-1), m.sortedIndex = function(n, t, r, e) {
        r = x(r, e, 1);
        for (var u = r(t), i = 0, o = O(n); o > i;) {
            var a = Math.floor((i + o) / 2);
            r(n[a]) < u ? i = a + 1 : o = a
        }
        return i
    }, m.indexOf = r(1, m.findIndex, m.sortedIndex), m.lastIndexOf = r(-1, m.findLastIndex), m.range = function(n, t, r) {
        null == t && (t = n || 0, n = 0), r = r || 1;
        for (var e = Math.max(Math.ceil((t - n) / r), 0), u = Array(e), i = 0; e > i; i++, n += r) u[i] = n;
        return u
    };
    var E = function(n, t, r, e, u) {
        if (!(e instanceof t)) return n.apply(r, u);
        var i = j(n.prototype),
            o = n.apply(i, u);
        return m.isObject(o) ? o : i
    };
    m.bind = function(n, t) {
        if (g && n.bind === g) return g.apply(n, l.call(arguments, 1));
        if (!m.isFunction(n)) throw new TypeError("Bind must be called on a function");
        var r = l.call(arguments, 2),
            e = function() {
                return E(n, e, t, this, r.concat(l.call(arguments)))
            };
        return e
    }, m.partial = function(n) {
        var t = l.call(arguments, 1),
            r = function() {
                for (var e = 0, u = t.length, i = Array(u), o = 0; u > o; o++) i[o] = t[o] === m ? arguments[e++] : t[o];
                for (; e < arguments.length;) i.push(arguments[e++]);
                return E(n, r, this, this, i)
            };
        return r
    }, m.bindAll = function(n) {
        var t, r, e = arguments.length;
        if (1 >= e) throw new Error("bindAll must be passed function names");
        for (t = 1; e > t; t++) r = arguments[t], n[r] = m.bind(n[r], n);
        return n
    }, m.memoize = function(n, t) {
        var r = function(e) {
            var u = r.cache,
                i = "" + (t ? t.apply(this, arguments) : e);
            return m.has(u, i) || (u[i] = n.apply(this, arguments)), u[i]
        };
        return r.cache = {}, r
    }, m.delay = function(n, t) {
        var r = l.call(arguments, 2);
        return setTimeout(function() {
            return n.apply(null, r)
        }, t)
    }, m.defer = m.partial(m.delay, m, 1), m.throttle = function(n, t, r) {
        var e, u, i, o = null,
            a = 0;
        r || (r = {});
        var c = function() {
            a = r.leading === !1 ? 0 : m.now(), o = null, i = n.apply(e, u), o || (e = u = null)
        };
        return function() {
            var f = m.now();
            a || r.leading !== !1 || (a = f);
            var l = t - (f - a);
            return e = this, u = arguments, 0 >= l || l > t ? (o && (clearTimeout(o), o = null), a = f, i = n.apply(e, u), o || (e = u = null)) : o || r.trailing === !1 || (o = setTimeout(c, l)), i
        }
    }, m.debounce = function(n, t, r) {
        var e, u, i, o, a, c = function() {
            var f = m.now() - o;
            t > f && f >= 0 ? e = setTimeout(c, t - f) : (e = null, r || (a = n.apply(i, u), e || (i = u = null)))
        };
        return function() {
            i = this, u = arguments, o = m.now();
            var f = r && !e;
            return e || (e = setTimeout(c, t)), f && (a = n.apply(i, u), i = u = null), a
        }
    }, m.wrap = function(n, t) {
        return m.partial(t, n)
    }, m.negate = function(n) {
        return function() {
            return !n.apply(this, arguments)
        }
    }, m.compose = function() {
        var n = arguments,
            t = n.length - 1;
        return function() {
            for (var r = t, e = n[t].apply(this, arguments); r--;) e = n[r].call(this, e);
            return e
        }
    }, m.after = function(n, t) {
        return function() {
            return --n < 1 ? t.apply(this, arguments) : void 0
        }
    }, m.before = function(n, t) {
        var r;
        return function() {
            return --n > 0 && (r = t.apply(this, arguments)), 1 >= n && (t = null), r
        }
    }, m.once = m.partial(m.before, 2);
    var M = !{
            toString: null
        }.propertyIsEnumerable("toString"),
        I = ["valueOf", "isPrototypeOf", "toString", "propertyIsEnumerable", "hasOwnProperty", "toLocaleString"];
    m.keys = function(n) {
        if (!m.isObject(n)) return [];
        if (v) return v(n);
        var t = [];
        for (var r in n) m.has(n, r) && t.push(r);
        return M && e(n, t), t
    }, m.allKeys = function(n) {
        if (!m.isObject(n)) return [];
        var t = [];
        for (var r in n) t.push(r);
        return M && e(n, t), t
    }, m.values = function(n) {
        for (var t = m.keys(n), r = t.length, e = Array(r), u = 0; r > u; u++) e[u] = n[t[u]];
        return e
    }, m.mapObject = function(n, t, r) {
        t = x(t, r);
        for (var e, u = m.keys(n), i = u.length, o = {}, a = 0; i > a; a++) e = u[a], o[e] = t(n[e], e, n);
        return o
    }, m.pairs = function(n) {
        for (var t = m.keys(n), r = t.length, e = Array(r), u = 0; r > u; u++) e[u] = [t[u], n[t[u]]];
        return e
    }, m.invert = function(n) {
        for (var t = {}, r = m.keys(n), e = 0, u = r.length; u > e; e++) t[n[r[e]]] = r[e];
        return t
    }, m.functions = m.methods = function(n) {
        var t = [];
        for (var r in n) m.isFunction(n[r]) && t.push(r);
        return t.sort()
    }, m.extend = _(m.allKeys), m.extendOwn = m.assign = _(m.keys), m.findKey = function(n, t, r) {
        t = x(t, r);
        for (var e, u = m.keys(n), i = 0, o = u.length; o > i; i++)
            if (e = u[i], t(n[e], e, n)) return e
    }, m.pick = function(n, t, r) {
        var e, u, i = {},
            o = n;
        if (null == o) return i;
        m.isFunction(t) ? (u = m.allKeys(o), e = b(t, r)) : (u = S(arguments, !1, !1, 1), e = function(n, t, r) {
            return t in r
        }, o = Object(o));
        for (var a = 0, c = u.length; c > a; a++) {
            var f = u[a],
                l = o[f];
            e(l, f, o) && (i[f] = l)
        }
        return i
    }, m.omit = function(n, t, r) {
        if (m.isFunction(t)) t = m.negate(t);
        else {
            var e = m.map(S(arguments, !1, !1, 1), String);
            t = function(n, t) {
                return !m.contains(e, t)
            }
        }
        return m.pick(n, t, r)
    }, m.defaults = _(m.allKeys, !0), m.create = function(n, t) {
        var r = j(n);
        return t && m.extendOwn(r, t), r
    }, m.clone = function(n) {
        return m.isObject(n) ? m.isArray(n) ? n.slice() : m.extend({}, n) : n
    }, m.tap = function(n, t) {
        return t(n), n
    }, m.isMatch = function(n, t) {
        var r = m.keys(t),
            e = r.length;
        if (null == n) return !e;
        for (var u = Object(n), i = 0; e > i; i++) {
            var o = r[i];
            if (t[o] !== u[o] || !(o in u)) return !1
        }
        return !0
    };
    var N = function(n, t, r, e) {
        if (n === t) return 0 !== n || 1 / n === 1 / t;
        if (null == n || null == t) return n === t;
        n instanceof m && (n = n._wrapped), t instanceof m && (t = t._wrapped);
        var u = s.call(n);
        if (u !== s.call(t)) return !1;
        switch (u) {
            case "[object RegExp]":
            case "[object String]":
                return "" + n == "" + t;
            case "[object Number]":
                return +n !== +n ? +t !== +t : 0 === +n ? 1 / +n === 1 / t : +n === +t;
            case "[object Date]":
            case "[object Boolean]":
                return +n === +t
        }
        var i = "[object Array]" === u;
        if (!i) {
            if ("object" != typeof n || "object" != typeof t) return !1;
            var o = n.constructor,
                a = t.constructor;
            if (o !== a && !(m.isFunction(o) && o instanceof o && m.isFunction(a) && a instanceof a) && "constructor" in n && "constructor" in t) return !1
        }
        r = r || [], e = e || [];
        for (var c = r.length; c--;)
            if (r[c] === n) return e[c] === t;
        if (r.push(n), e.push(t), i) {
            if (c = n.length, c !== t.length) return !1;
            for (; c--;)
                if (!N(n[c], t[c], r, e)) return !1
        } else {
            var f, l = m.keys(n);
            if (c = l.length, m.keys(t).length !== c) return !1;
            for (; c--;)
                if (f = l[c], !m.has(t, f) || !N(n[f], t[f], r, e)) return !1
        }
        return r.pop(), e.pop(), !0
    };
    m.isEqual = function(n, t) {
        return N(n, t)
    }, m.isEmpty = function(n) {
        return null == n ? !0 : k(n) && (m.isArray(n) || m.isString(n) || m.isArguments(n)) ? 0 === n.length : 0 === m.keys(n).length
    }, m.isElement = function(n) {
        return !(!n || 1 !== n.nodeType)
    }, m.isArray = h || function(n) {
        return "[object Array]" === s.call(n)
    }, m.isObject = function(n) {
        var t = typeof n;
        return "function" === t || "object" === t && !!n
    }, m.each(["Arguments", "Function", "String", "Number", "Date", "RegExp", "Error"], function(n) {
        m["is" + n] = function(t) {
            return s.call(t) === "[object " + n + "]"
        }
    }), m.isArguments(arguments) || (m.isArguments = function(n) {
        return m.has(n, "callee")
    }), "function" != typeof /./ && "object" != typeof Int8Array && (m.isFunction = function(n) {
        return "function" == typeof n || !1
    }), m.isFinite = function(n) {
        return isFinite(n) && !isNaN(parseFloat(n))
    }, m.isNaN = function(n) {
        return m.isNumber(n) && n !== +n
    }, m.isBoolean = function(n) {
        return n === !0 || n === !1 || "[object Boolean]" === s.call(n)
    }, m.isNull = function(n) {
        return null === n
    }, m.isUndefined = function(n) {
        return n === void 0
    }, m.has = function(n, t) {
        return null != n && p.call(n, t)
    }, m.noConflict = function() {
        return u._ = i, this
    }, m.identity = function(n) {
        return n
    }, m.constant = function(n) {
        return function() {
            return n
        }
    }, m.noop = function() {}, m.property = w, m.propertyOf = function(n) {
        return null == n ? function() {} : function(t) {
            return n[t]
        }
    }, m.matcher = m.matches = function(n) {
        return n = m.extendOwn({}, n),
            function(t) {
                return m.isMatch(t, n)
            }
    }, m.times = function(n, t, r) {
        var e = Array(Math.max(0, n));
        t = b(t, r, 1);
        for (var u = 0; n > u; u++) e[u] = t(u);
        return e
    }, m.random = function(n, t) {
        return null == t && (t = n, n = 0), n + Math.floor(Math.random() * (t - n + 1))
    }, m.now = Date.now || function() {
        return (new Date).getTime()
    };
    var B = {
            "&": "&amp;",
            "<": "&lt;",
            ">": "&gt;",
            '"': "&quot;",
            "'": "&#x27;",
            "`": "&#x60;"
        },
        T = m.invert(B),
        R = function(n) {
            var t = function(t) {
                    return n[t]
                },
                r = "(?:" + m.keys(n).join("|") + ")",
                e = RegExp(r),
                u = RegExp(r, "g");
            return function(n) {
                return n = null == n ? "" : "" + n, e.test(n) ? n.replace(u, t) : n
            }
        };
    m.escape = R(B), m.unescape = R(T), m.result = function(n, t, r) {
        var e = null == n ? void 0 : n[t];
        return e === void 0 && (e = r), m.isFunction(e) ? e.call(n) : e
    };
    var q = 0;
    m.uniqueId = function(n) {
        var t = ++q + "";
        return n ? n + t : t
    }, m.templateSettings = {
        evaluate: /<%([\s\S]+?)%>/g,
        interpolate: /<%=([\s\S]+?)%>/g,
        escape: /<%-([\s\S]+?)%>/g
    };
    var K = /(.)^/,
        z = {
            "'": "'",
            "\\": "\\",
            "\r": "r",
            "\n": "n",
            "\u2028": "u2028",
            "\u2029": "u2029"
        },
        D = /\\|'|\r|\n|\u2028|\u2029/g,
        L = function(n) {
            return "\\" + z[n]
        };
    m.template = function(n, t, r) {
        !t && r && (t = r), t = m.defaults({}, t, m.templateSettings);
        var e = RegExp([(t.escape || K).source, (t.interpolate || K).source, (t.evaluate || K).source].join("|") + "|$", "g"),
            u = 0,
            i = "__p+='";
        n.replace(e, function(t, r, e, o, a) {
            return i += n.slice(u, a).replace(D, L), u = a + t.length, r ? i += "'+\n((__t=(" + r + "))==null?'':_.escape(__t))+\n'" : e ? i += "'+\n((__t=(" + e + "))==null?'':__t)+\n'" : o && (i += "';\n" + o + "\n__p+='"), t
        }), i += "';\n", t.variable || (i = "with(obj||{}){\n" + i + "}\n"), i = "var __t,__p='',__j=Array.prototype.join," + "print=function(){__p+=__j.call(arguments,'');};\n" + i + "return __p;\n";
        try {
            var o = new Function(t.variable || "obj", "_", i)
        } catch (a) {
            throw a.source = i, a
        }
        var c = function(n) {
                return o.call(this, n, m)
            },
            f = t.variable || "obj";
        return c.source = "function(" + f + "){\n" + i + "}", c
    }, m.chain = function(n) {
        var t = m(n);
        return t._chain = !0, t
    };
    var P = function(n, t) {
        return n._chain ? m(t).chain() : t
    };
    m.mixin = function(n) {
        m.each(m.functions(n), function(t) {
            var r = m[t] = n[t];
            m.prototype[t] = function() {
                var n = [this._wrapped];
                return f.apply(n, arguments), P(this, r.apply(m, n))
            }
        })
    }, m.mixin(m), m.each(["pop", "push", "reverse", "shift", "sort", "splice", "unshift"], function(n) {
        var t = o[n];
        m.prototype[n] = function() {
            var r = this._wrapped;
            return t.apply(r, arguments), "shift" !== n && "splice" !== n || 0 !== r.length || delete r[0], P(this, r)
        }
    }), m.each(["concat", "join", "slice"], function(n) {
        var t = o[n];
        m.prototype[n] = function() {
            return P(this, t.apply(this._wrapped, arguments))
        }
    }), m.prototype.value = function() {
        return this._wrapped
    }, m.prototype.valueOf = m.prototype.toJSON = m.prototype.value, m.prototype.toString = function() {
        return "" + this._wrapped
    }, "function" == typeof define && define.amd && define("underscore", [], function() {
        return m
    })
}).call(this);

; // GoogleAnalytics/GoogleAnalyticsEvents.js
var GoogleAnalyticsEvents = {
    LocalEventLog: [],
    SetCustomVar: function(index, name, value, scope) {
        if (window._gaq) {
            if (!window.GoogleAnalyticsDisableRoblox2) {
                _gaq.push(['_setCustomVar', index, name, value, scope]);
            }
            _gaq.push(['b._setCustomVar', index, name, value, scope]);
        }
    },
    FireEvent: function(args) {
        if (window._gaq) {
            if (!window.GoogleAnalyticsDisableRoblox2) {
                var eventsArray = ["_trackEvent"];
                eventsArray = eventsArray.concat(args);
                _gaq.push(eventsArray);
                GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(eventsArray));
            }
            var eventsArrayB = ["b._trackEvent"];
            eventsArrayB = eventsArrayB.concat(args);
            _gaq.push(eventsArrayB);
            GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(eventsArrayB));
        }
    },
    ViewVirtual: function(url) {
        if (window._gaq) {
            if (!window.GoogleAnalyticsDisableRoblox2) {
                var eventsArray = ['_trackPageview', url];
                window._gaq.push(eventsArray);
                GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(eventsArray));
            }
            var eventsArrayB = ['b._trackPageview', url];
            window._gaq.push(eventsArrayB);
            GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(eventsArrayB));
        }
    },
    TrackTransaction: function(orderId, priceTotal) {
        if (window._gaq) {
            var transArray = ['_addTrans', orderId, 'Roblox', priceTotal, '0', '0', 'San Mateo', 'California', 'USA'];
            if (!window.GoogleAnalyticsDisableRoblox2) {
                _gaq.push(transArray);
                GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(transArray));
            }
            transArray[0] = 'b.' + transArray[0];
            _gaq.push(transArray);
            GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(transArray));
        }
    },
    TrackTransactionItem: function(orderId, sku, name, category, price) {
        if (window._gaq) {
            var itemArray = ['_addItem', orderId, sku, name, category, price, 1];
            var trackTransArray = ['_trackTrans'];
            if (!window.GoogleAnalyticsDisableRoblox2) {
                _gaq.push(itemArray);
                GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(itemArray));
                _gaq.push(trackTransArray);
                GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(trackTransArray));
            }
            itemArray[0] = 'b.' + itemArray[0];
            trackTransArray[0] = 'b.' + trackTransArray[0];
            _gaq.push(itemArray);
            GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(itemArray));
            _gaq.push(trackTransArray);
            GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(trackTransArray));
        }
    },
    Log: function(eventsArray) {
        GoogleAnalyticsEvents.LocalEventLog.push(makeGoogleAnalyticsLogObject(eventsArray));
    }
};

function makeGoogleAnalyticsLogObject(event_params) {
    var newLogObject = {};
    newLogObject.event = event_params;
    newLogObject.timestamp = new Date().getTime();
    return newLogObject;
}

function GoogleAnalyticsTimingTracker(category, variable, optLabel, isDebug) {
    this.maxTime = 1 * 60 * 1000;
    this.category = category;
    this.variable = variable;
    this.label = optLabel ? optLabel : undefined;
    this.isDebug = isDebug;
}
GoogleAnalyticsTimingTracker.prototype.getTimeStamp = function() {
    if (window.performance && window.performance.now) {
        return Math.round(window.performance.now());
    }
    return new Date().getTime();
};
GoogleAnalyticsTimingTracker.prototype.start = function() {
    this.startTime = this.getTimeStamp();
};
GoogleAnalyticsTimingTracker.prototype.stop = function() {
    this.elapsedTime = this.getTimeStamp() - this.startTime;
};
GoogleAnalyticsTimingTracker.prototype.send = function() {
    if (0 < this.elapsedTime && this.elapsedTime < this.maxTime) {
        var command = ['b._trackTiming', this.category, this.variable, this.elapsedTime, this.label, 100];
        window._gaq.push(command);
    }
};

; // RobloxEventManager.js
RobloxEventManager = new function() {
    var cookieStoreEvents = [];
    var dataStore = {};
    this.enabled = false;
    this.initialized = false;
    this.eventQueue = [];
    this.initialize = function(enabled) {
        this.initialized = true;
        this.enabled = enabled;
        while (this.eventQueue.length > 0) {
            var event = this.eventQueue.pop();
            this.triggerEvent(event.eventName, event.args);
        }
    };
    this.triggerEvent = function(eventName, args) {
        if (this.initialized) {
            if (this.enabled) {
                if (typeof args === 'undefined')
                    args = {};
                args.guid = Roblox.Cookies.getBrowserTrackerId();
                if (args.guid != -1)
                    $(document).trigger(eventName, [args]);
            }
        } else {
            this.eventQueue.push({
                eventName: eventName,
                args: args
            });
        }
    };
    this.registerCookieStoreEvent = function(eventName) {
        cookieStoreEvents.push(eventName);
    };
    this.insertDataStoreKeyValuePair = function(key, value) {
        dataStore[key] = value;
    };
};

function RBXBaseEventListener() {
    if (!(this instanceof RBXBaseEventListener)) {
        return new RBXBaseEventListener();
    }
    this.init = function() {
        for (eventKey in this.events) {
            if (this.events.hasOwnProperty(eventKey)) {
                $(document).bind(this.events[eventKey], $.proxy(this.localCopy, this));
            }
        }
    };
    this.events = [];
    this.localCopy = function(event, data) {
        var localEvent = $.extend(true, {}, event);
        var localData = $.extend(true, {}, data);
        this.handleEvent(localEvent, localData);
    };
    this.distillData = function(data, mapping) {
        console.log('RBXEventListener distillData - Please implement me');
        return false;
    };
    this.handleEvent = function(event) {
        console.log('EventListener handleEvent - Please implement me');
        return false;
    };
    this.fireEvent = function(evtStr) {
        console.log('EventListener fireEvent - Please implement me');
        return false;
    };
}

; // GoogleEventListener.js
GoogleListener = new RBXBaseEventListener();
GoogleListener.handleEvent = function(event, data) {
    function translateOsString(str) {
        str = str.toLowerCase();
        if (str == "win32")
            str = "Windows";
        else if (str == "osx")
            str = "Mac";
        return str;
    }
    var gEvent, gData, dataMap;
    switch (event.type) {
        case 'rbx_evt_initial_install_begin':
            data['os'] = translateOsString(data['os']);
            data['category'] = 'Bootstrapper Install Begin';
            dataMap = {
                os: 'action'
            };
            break;
        case 'rbx_evt_ftp':
            data['os'] = translateOsString(data['os']);
            data['category'] = 'First Time Played';
            dataMap = {
                os: 'action'
            };
            break;
        case 'rbx_evt_initial_install_success':
            data['os'] = translateOsString(data['os']);
            data['category'] = 'Bootstrapper Install Success';
            dataMap = {
                os: 'action'
            };
            break;
        case 'rbx_evt_fmp':
            data['os'] = translateOsString(data['os']);
            data['category'] = 'Five Minute Play';
            dataMap = {
                os: 'action'
            };
            break;
        case 'rbx_evt_abtest':
            dataMap = {
                experiment: 'category',
                variation: 'action',
                version: 'opt_label'
            };
            break;
        case 'rbx_evt_card_redemption':
            data['category'] = "CardRedemption";
            dataMap = {
                merchant: 'action',
                cardValue: 'opt_label'
            };
            break;
        default:
            console.log('GoogleListener - Event registered without handling instructions: ' + event.type);
            return false;
    }
    dataMap['category'] = 'category';
    gData = this.distillData(data, dataMap);
    this.fireEvent(gData);
    return true;
}
GoogleListener.distillData = function(data, mapping) {
    var distilled = {};
    for (dataKey in mapping) {
        if (typeof(data[dataKey]) != typeof(undefined))
            distilled[mapping[dataKey]] = data[dataKey];
    }
    var eventParams = [distilled['category'], distilled['action']];
    if (distilled['opt_label'] != null) {
        eventParams = eventParams.concat(distilled['opt_label']);
    }
    if (distilled['opt_value'] != null) {
        eventParams = eventParams.concat(distilled['opt_value']);
    }
    return eventParams;
}
GoogleListener.fireEvent = function(processedEvent) {
    if (typeof(_gaq) != typeof(undefined)) {
        var eventsArray = ["_trackEvent"];
        var eventsArrayB = ["b._trackEvent"];
        _gaq.push(eventsArray.concat(processedEvent));
        _gaq.push(eventsArrayB.concat(processedEvent));
    }
}
GoogleListener.events = ['rbx_evt_initial_install_begin', 'rbx_evt_ftp', 'rbx_evt_initial_install_success', 'rbx_evt_fmp', 'rbx_evt_abtest', 'rbx_evt_card_redemption'];

; // utilities/deviceFeatureDetection.js
Roblox = Roblox || {};
Roblox.DeviceFeatureDetection = (function() {
    var isTouch = false;
    var containerMain = $(".container-main");

    function detectTouch() {
        if ((!containerMain.hasClass("in-studio")) && ('ontouchstart' in window || navigator.maxTouchPoints > 0 || navigator.msMaxTouchPoints > 0)) {
            isTouch = true;
            containerMain.addClass("touch");
        }
    }
    detectTouch();
    return {
        isTouch: isTouch
    }
})();

; // utilities/lazyLoad.js
"use strict";
Roblox = Roblox || {};
Roblox.LazyLoad = (function() {
    var imageSelector = "img[data-delaysrc]";
    var iframeSelector = "iframe[data-delaysrc]:not('.src-replaced')";
    var loginSelectors = "#head-login, #header-login";

    function updateSrc(element) {
        if (element) {
            var delaySrc = element.attr("data-delaysrc");
            if (typeof delaySrc !== "undefined") {
                element.attr("src", delaySrc).addClass("src-replaced");
            }
        }
    }

    function setupLazyLoad() {
        window.addEventListener("load", function() {
            $(imageSelector + ", " + iframeSelector).each(function() {
                updateSrc($(this));
            });
        }, false);
    }

    function addLoginButtonListenerToUpdateIframeSrc() {
        $(loginSelectors).one("click touchstart", function() {
            var loginIframe = $("#iframe-login:not('.src-replaced')");
            updateSrc(loginIframe);
        });
    }

    function init() {
        setupLazyLoad();
        addLoginButtonListenerToUpdateIframeSrc();
    }
    $(document).ready(function() {
        init();
    });
})();

; // utilities/urlParser.js
var Roblox = Roblox || {};
Roblox.UrlParser = (function() {
    var getParameterValueByName = function(name, paramNameCaseSensitive) {
        if (typeof(paramNameCaseSensitive) === "undefined") {
            paramNameCaseSensitive = true;
        } else if (paramNameCaseSensitive === false) {
            name = name.toLowerCase();
        }
        var url = decodeURIComponent(window.location.search.substring(1));
        var urlParameters = url && url.split('&');
        if (!urlParameters) {
            return null;
        }
        for (var i = 0; i < urlParameters.length; i++) {
            var parameter = urlParameters[i];
            var indexOfSeparator = parameter.indexOf("=");
            var namePart = parameter.substring(0, indexOfSeparator);
            var valuePart = parameter.substring(indexOfSeparator + 1);
            if (paramNameCaseSensitive === false) {
                namePart = namePart.toLowerCase();
            }
            if (namePart === name) {
                return valuePart;
            }
        }
        return null;
    }
    var getParametersAsObject = function() {
        var result = {};
        var url = decodeURIComponent(window.location.search.substring(1));
        var urlParameters = url && url.split('&');
        if (!urlParameters) {
            return result;
        }
        for (var i = 0; i < urlParameters.length; i++) {
            var parameter = urlParameters[i];
            var indexOfSeparator = parameter.indexOf("=");
            var namePart = parameter.substring(0, indexOfSeparator);
            var valuePart = parameter.substring(indexOfSeparator + 1);
            result[namePart] = valuePart;
        }
        return result;
    }
    var addOrUpdateQueryStringParameter = function(uri, paramName, paramValue) {
        var re = new RegExp("([?&])" + paramName + "=.*?(&|$)", "i");
        var separator = uri.indexOf('?') !== -1 ? "&" : "?";
        if (uri.match(re)) {
            return uri.replace(re, '$1' + paramName + "=" + paramValue + '$2');
        } else {
            return uri + separator + paramName + "=" + paramValue;
        }
    }
    return {
        getParameterValueByName: getParameterValueByName,
        getParametersAsObject: getParametersAsObject,
        addOrUpdateQueryStringParameter: addOrUpdateQueryStringParameter
    }
})();

; // utilities/generalSubmitButton.js
var Roblox = Roblox || {};
Roblox.SubmitButton = (function() {
    var buttonCssSelector = ".submit-button";
    var clickableCssSelector = "clickable";
    var multiClickCssSelector = "allow-multi-click";
    var clickCallbackCssSelector = "callback";
    var buttonEnabledClass = "btn-primary";
    var buttonDisabledClass = "btn-disabled-primary";
    var disabledClass = "disabled";
    var submitToggleEvent = "Roblox.SubmitButton.toggleButton";

    function init() {
        $(buttonCssSelector).each(function(idx, element) {
            var button = $(element);
            var callbackObject = button.data(clickCallbackCssSelector);
            if (!callbackObject || typeof callbackObject !== "object")
                return;
            var canMultiClick = button.data(multiClickCssSelector) === "true";
            var clickCallback = getClickHandler(button, callbackObject, canMultiClick);
            var toggleButtonFunc = getToggleButtonHandler(button, clickCallback);
            button.on(submitToggleEvent, toggleButtonFunc);
            var clickable = button.data(clickCallbackCssSelector) !== "false";
            toggleButtonFunc(null, clickable);
        });
    }

    function getClickHandler(button, callbackObject, allowMultiClick) {
        return function(e) {
            var clickable = button.data(clickableCssSelector) === "true";
            if (!clickable) {
                e.preventDefault();
                return;
            }
            var successFlag = false;
            if (callbackObject) {
                var caller = callbackObject.object.split(".");
                var target = window[caller[0]];
                for (var i = 1; i < caller.length; i++) {
                    target = target[caller[i]];
                }
                if (target) {
                    var callback = target[callbackObject.func];
                    if (typeof callback === "function") {
                        try {
                            callback();
                            successFlag = true;
                        } catch (e) {
                            successFlag = false;
                        }
                    }
                }
            }
            if (!allowMultiClick && successFlag) {
                button.trigger(submitToggleEvent, false);
            }
        }
    }

    function getToggleButtonHandler(button, clickCallback) {
        return function(event, enabled) {
            if (enabled) {
                button.data(clickableCssSelector, "true");
                button.addClass(buttonEnabledClass).removeClass(buttonDisabledClass).removeClass(disabledClass);
                button.on("click", clickCallback);
            } else {
                button.addClass(buttonDisabledClass).addClass(disabledClass).removeClass(buttonEnabledClass);
                button.data(clickableCssSelector, "false");
                button.off("click");
            }
        }
    }
    return {
        init: init,
        submitToggleEvent: submitToggleEvent
    }
})();
$(function() {
    Roblox.SubmitButton.init();
});

; // DeveloperConsoleWarning.js
if (typeof Roblox === 'undefined') {
    Roblox = {};
}
if (typeof Roblox.DeveloperConsoleWarning === 'undefined') {
    Roblox.DeveloperConsoleWarning = (function() {
        var warningText = "\n" +
            "      _______      _________      _____       ______     _\n" +
            "     / _____ \\    |____ ____|    / ___ \\     | ____ \\   | |\n" +
            "    / /     \\_\\       | |       / /   \\ \\    | |   \\ \\  | |\n" +
            "    | |               | |      / /     \\ \\   | |   | |  | |\n" +
            "    \\ \\______         | |      | |     | |   | |___/ /  | |\n" +
            "     \\______ \\        | |      | |     | |   |  ____/   | |\n" +
            "            \\ \\       | |      | |     | |   | |        | |\n" +
            "     _      | |       | |      \\ \\     / /   | |        |_|\n" +
            "    \\ \\_____/ /       | |       \\ \\___/ /    | |         _\n" +
            "     \\_______/        |_|        \\_____/     |_|        |_|\n" +
            "\n" +
            "     Keep your account safe! Do not send any information from\n" +
            "     here to anyone or paste any text here.\n" +
            "\n" +
            "     If someone is asking you to copy or paste text here then\n" +
            "     you're giving someone access to your account, your gear,\n" +
            "     and your Robux.\n" +
            "\n" +
            "     To learn more about keeping your account safe you can go to\n" +
            "\n" +
            "     https://www.roblox.com/info/account-safety";
        var showWarning = function() {
            if (typeof console !== "undefined") {
                if (typeof console.log !== "undefined") {
                    console.log(warningText);
                }
            }
        };
        return {
            showWarning: showWarning
        };
    })();
}

; // widgets/jquery.mCustomScrollbar.concat.min.js
/* == jquery mousewheel plugin == Version: 3.1.12, License: MIT License (MIT) */
! function(a) {
    "function" == typeof define && define.amd ? define(["jquery"], a) : "object" == typeof exports ? module.exports = a : a(jQuery)
}(function(a) {
    function b(b) {
        var g = b || window.event,
            h = i.call(arguments, 1),
            j = 0,
            l = 0,
            m = 0,
            n = 0,
            o = 0,
            p = 0;
        if (b = a.event.fix(g), b.type = "mousewheel", "detail" in g && (m = -1 * g.detail), "wheelDelta" in g && (m = g.wheelDelta), "wheelDeltaY" in g && (m = g.wheelDeltaY), "wheelDeltaX" in g && (l = -1 * g.wheelDeltaX), "axis" in g && g.axis === g.HORIZONTAL_AXIS && (l = -1 * m, m = 0), j = 0 === m ? l : m, "deltaY" in g && (m = -1 * g.deltaY, j = m), "deltaX" in g && (l = g.deltaX, 0 === m && (j = -1 * l)), 0 !== m || 0 !== l) {
            if (1 === g.deltaMode) {
                var q = a.data(this, "mousewheel-line-height");
                j *= q, m *= q, l *= q
            } else if (2 === g.deltaMode) {
                var r = a.data(this, "mousewheel-page-height");
                j *= r, m *= r, l *= r
            }
            if (n = Math.max(Math.abs(m), Math.abs(l)), (!f || f > n) && (f = n, d(g, n) && (f /= 40)), d(g, n) && (j /= 40, l /= 40, m /= 40), j = Math[j >= 1 ? "floor" : "ceil"](j / f), l = Math[l >= 1 ? "floor" : "ceil"](l / f), m = Math[m >= 1 ? "floor" : "ceil"](m / f), k.settings.normalizeOffset && this.getBoundingClientRect) {
                var s = this.getBoundingClientRect();
                o = b.clientX - s.left, p = b.clientY - s.top
            }
            return b.deltaX = l, b.deltaY = m, b.deltaFactor = f, b.offsetX = o, b.offsetY = p, b.deltaMode = 0, h.unshift(b, j, l, m), e && clearTimeout(e), e = setTimeout(c, 200), (a.event.dispatch || a.event.handle).apply(this, h)
        }
    }

    function c() {
        f = null
    }

    function d(a, b) {
        return k.settings.adjustOldDeltas && "mousewheel" === a.type && b % 120 === 0
    }
    var e, f, g = ["wheel", "mousewheel", "DOMMouseScroll", "MozMousePixelScroll"],
        h = "onwheel" in document || document.documentMode >= 9 ? ["wheel"] : ["mousewheel", "DomMouseScroll", "MozMousePixelScroll"],
        i = Array.prototype.slice;
    if (a.event.fixHooks)
        for (var j = g.length; j;) a.event.fixHooks[g[--j]] = a.event.mouseHooks;
    var k = a.event.special.mousewheel = {
        version: "3.1.12",
        setup: function() {
            if (this.addEventListener)
                for (var c = h.length; c;) this.addEventListener(h[--c], b, !1);
            else this.onmousewheel = b;
            a.data(this, "mousewheel-line-height", k.getLineHeight(this)), a.data(this, "mousewheel-page-height", k.getPageHeight(this))
        },
        teardown: function() {
            if (this.removeEventListener)
                for (var c = h.length; c;) this.removeEventListener(h[--c], b, !1);
            else this.onmousewheel = null;
            a.removeData(this, "mousewheel-line-height"), a.removeData(this, "mousewheel-page-height")
        },
        getLineHeight: function(b) {
            var c = a(b),
                d = c["offsetParent" in a.fn ? "offsetParent" : "parent"]();
            return d.length || (d = a("body")), parseInt(d.css("fontSize"), 10) || parseInt(c.css("fontSize"), 10) || 16
        },
        getPageHeight: function(b) {
            return a(b).height()
        },
        settings: {
            adjustOldDeltas: !0,
            normalizeOffset: !0
        }
    };
    a.fn.extend({
        mousewheel: function(a) {
            return a ? this.bind("mousewheel", a) : this.trigger("mousewheel")
        },
        unmousewheel: function(a) {
            return this.unbind("mousewheel", a)
        }
    })
});
/* == malihu jquery custom scrollbar plugin == Version: 3.1.0, License: MIT License (MIT) */
! function(e) {
    "undefined" != typeof module && module.exports ? module.exports = e : e(jQuery, window, document)
}(function(e) {
    ! function(t) {
        var o = "function" == typeof define && define.amd,
            a = "undefined" != typeof module && module.exports,
            n = "https:" == document.location.protocol ? "https:" : "http:",
            i = "cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.12/jquery.mousewheel.min.js";
        o || (a ? require("jquery-mousewheel")(e) : e.event.special.mousewheel || e("head").append(decodeURI("%3Cscript src=" + n + "//" + i + "%3E%3C/script%3E"))), t()
    }(function() {
        var t, o = "mCustomScrollbar",
            a = "mCS",
            n = ".mCustomScrollbar",
            i = {
                setTop: 0,
                setLeft: 0,
                axis: "y",
                scrollbarPosition: "inside",
                scrollInertia: 950,
                autoDraggerLength: !0,
                alwaysShowScrollbar: 0,
                snapOffset: 0,
                mouseWheel: {
                    enable: !0,
                    scrollAmount: "auto",
                    axis: "y",
                    deltaFactor: "auto",
                    disableOver: ["select", "option", "keygen", "datalist", "textarea"]
                },
                scrollButtons: {
                    scrollType: "stepless",
                    scrollAmount: "auto"
                },
                keyboard: {
                    enable: !0,
                    scrollType: "stepless",
                    scrollAmount: "auto"
                },
                contentTouchScroll: 25,
                advanced: {
                    autoScrollOnFocus: "input,textarea,select,button,datalist,keygen,a[tabindex],area,object,[contenteditable='true']",
                    updateOnContentResize: !0,
                    updateOnImageLoad: "auto",
                    autoUpdateTimeout: 60
                },
                theme: "light",
                callbacks: {
                    onTotalScrollOffset: 0,
                    onTotalScrollBackOffset: 0,
                    alwaysTriggerOffsets: !0
                }
            },
            r = 0,
            l = {},
            s = window.attachEvent && !window.addEventListener ? 1 : 0,
            c = !1,
            d = ["mCSB_dragger_onDrag", "mCSB_scrollTools_onDrag", "mCS_img_loaded", "mCS_disabled", "mCS_destroyed", "mCS_no_scrollbar", "mCS-autoHide", "mCS-dir-rtl", "mCS_no_scrollbar_y", "mCS_no_scrollbar_x", "mCS_y_hidden", "mCS_x_hidden", "mCSB_draggerContainer", "mCSB_buttonUp", "mCSB_buttonDown", "mCSB_buttonLeft", "mCSB_buttonRight"],
            u = {
                init: function(t) {
                    var t = e.extend(!0, {}, i, t),
                        o = f.call(this);
                    if (t.live) {
                        var s = t.liveSelector || this.selector || n,
                            c = e(s);
                        if ("off" === t.live) return void m(s);
                        l[s] = setTimeout(function() {
                            c.mCustomScrollbar(t), "once" === t.live && c.length && m(s)
                        }, 500)
                    } else m(s);
                    return t.setWidth = t.set_width ? t.set_width : t.setWidth, t.setHeight = t.set_height ? t.set_height : t.setHeight, t.axis = t.horizontalScroll ? "x" : p(t.axis), t.scrollInertia = t.scrollInertia > 0 && t.scrollInertia < 17 ? 17 : t.scrollInertia, "object" != typeof t.mouseWheel && 1 == t.mouseWheel && (t.mouseWheel = {
                        enable: !0,
                        scrollAmount: "auto",
                        axis: "y",
                        preventDefault: !1,
                        deltaFactor: "auto",
                        normalizeDelta: !1,
                        invert: !1
                    }), t.mouseWheel.scrollAmount = t.mouseWheelPixels ? t.mouseWheelPixels : t.mouseWheel.scrollAmount, t.mouseWheel.normalizeDelta = t.advanced.normalizeMouseWheelDelta ? t.advanced.normalizeMouseWheelDelta : t.mouseWheel.normalizeDelta, t.scrollButtons.scrollType = g(t.scrollButtons.scrollType), h(t), e(o).each(function() {
                        var o = e(this);
                        if (!o.data(a)) {
                            o.data(a, {
                                idx: ++r,
                                opt: t,
                                scrollRatio: {
                                    y: null,
                                    x: null
                                },
                                overflowed: null,
                                contentReset: {
                                    y: null,
                                    x: null
                                },
                                bindEvents: !1,
                                tweenRunning: !1,
                                sequential: {},
                                langDir: o.css("direction"),
                                cbOffsets: null,
                                trigger: null,
                                poll: {
                                    size: {
                                        o: 0,
                                        n: 0
                                    },
                                    img: {
                                        o: 0,
                                        n: 0
                                    },
                                    change: {
                                        o: 0,
                                        n: 0
                                    }
                                }
                            });
                            var n = o.data(a),
                                i = n.opt,
                                l = o.data("mcs-axis"),
                                s = o.data("mcs-scrollbar-position"),
                                c = o.data("mcs-theme");
                            l && (i.axis = l), s && (i.scrollbarPosition = s), c && (i.theme = c, h(i)), v.call(this), n && i.callbacks.onCreate && "function" == typeof i.callbacks.onCreate && i.callbacks.onCreate.call(this), e("#mCSB_" + n.idx + "_container img:not(." + d[2] + ")").addClass(d[2]), u.update.call(null, o)
                        }
                    })
                },
                update: function(t, o) {
                    var n = t || f.call(this);
                    return e(n).each(function() {
                        var t = e(this);
                        if (t.data(a)) {
                            var n = t.data(a),
                                i = n.opt,
                                r = e("#mCSB_" + n.idx + "_container"),
                                l = e("#mCSB_" + n.idx),
                                s = [e("#mCSB_" + n.idx + "_dragger_vertical"), e("#mCSB_" + n.idx + "_dragger_horizontal")];
                            if (!r.length) return;
                            n.tweenRunning && N(t), o && n && i.callbacks.onBeforeUpdate && "function" == typeof i.callbacks.onBeforeUpdate && i.callbacks.onBeforeUpdate.call(this), t.hasClass(d[3]) && t.removeClass(d[3]), t.hasClass(d[4]) && t.removeClass(d[4]), l.height() !== t.height() && l.css("max-height", t.height()), _.call(this), "y" === i.axis || i.advanced.autoExpandHorizontalScroll || r.css("width", x(r)), n.overflowed = y.call(this), M.call(this), i.autoDraggerLength && S.call(this), b.call(this), T.call(this);
                            var c = [Math.abs(r[0].offsetTop), Math.abs(r[0].offsetLeft)];
                            "x" !== i.axis && (n.overflowed[0] ? s[0].height() > s[0].parent().height() ? B.call(this) : (V(t, c[0].toString(), {
                                dir: "y",
                                dur: 0,
                                overwrite: "none"
                            }), n.contentReset.y = null) : (B.call(this), "y" === i.axis ? k.call(this) : "yx" === i.axis && n.overflowed[1] && V(t, c[1].toString(), {
                                dir: "x",
                                dur: 0,
                                overwrite: "none"
                            }))), "y" !== i.axis && (n.overflowed[1] ? s[1].width() > s[1].parent().width() ? B.call(this) : (V(t, c[1].toString(), {
                                dir: "x",
                                dur: 0,
                                overwrite: "none"
                            }), n.contentReset.x = null) : (B.call(this), "x" === i.axis ? k.call(this) : "yx" === i.axis && n.overflowed[0] && V(t, c[0].toString(), {
                                dir: "y",
                                dur: 0,
                                overwrite: "none"
                            }))), o && n && (2 === o && i.callbacks.onImageLoad && "function" == typeof i.callbacks.onImageLoad ? i.callbacks.onImageLoad.call(this) : 3 === o && i.callbacks.onSelectorChange && "function" == typeof i.callbacks.onSelectorChange ? i.callbacks.onSelectorChange.call(this) : i.callbacks.onUpdate && "function" == typeof i.callbacks.onUpdate && i.callbacks.onUpdate.call(this)), j.call(this)
                        }
                    })
                },
                scrollTo: function(t, o) {
                    if ("undefined" != typeof t && null != t) {
                        var n = f.call(this);
                        return e(n).each(function() {
                            var n = e(this);
                            if (n.data(a)) {
                                var i = n.data(a),
                                    r = i.opt,
                                    l = {
                                        trigger: "external",
                                        scrollInertia: r.scrollInertia,
                                        scrollEasing: "mcsEaseInOut",
                                        moveDragger: !1,
                                        timeout: 60,
                                        callbacks: !0,
                                        onStart: !0,
                                        onUpdate: !0,
                                        onComplete: !0
                                    },
                                    s = e.extend(!0, {}, l, o),
                                    c = q.call(this, t),
                                    d = s.scrollInertia > 0 && s.scrollInertia < 17 ? 17 : s.scrollInertia;
                                c[0] = Y.call(this, c[0], "y"), c[1] = Y.call(this, c[1], "x"), s.moveDragger && (c[0] *= i.scrollRatio.y, c[1] *= i.scrollRatio.x), s.dur = d, setTimeout(function() {
                                    null !== c[0] && "undefined" != typeof c[0] && "x" !== r.axis && i.overflowed[0] && (s.dir = "y", s.overwrite = "all", V(n, c[0].toString(), s)), null !== c[1] && "undefined" != typeof c[1] && "y" !== r.axis && i.overflowed[1] && (s.dir = "x", s.overwrite = "none", V(n, c[1].toString(), s))
                                }, s.timeout)
                            }
                        })
                    }
                },
                stop: function() {
                    var t = f.call(this);
                    return e(t).each(function() {
                        var t = e(this);
                        t.data(a) && N(t)
                    })
                },
                disable: function(t) {
                    var o = f.call(this);
                    return e(o).each(function() {
                        var o = e(this);
                        if (o.data(a)) {
                            {
                                o.data(a)
                            }
                            j.call(this, "remove"), k.call(this), t && B.call(this), M.call(this, !0), o.addClass(d[3])
                        }
                    })
                },
                destroy: function() {
                    var t = f.call(this);
                    return e(t).each(function() {
                        var n = e(this);
                        if (n.data(a)) {
                            var i = n.data(a),
                                r = i.opt,
                                l = e("#mCSB_" + i.idx),
                                s = e("#mCSB_" + i.idx + "_container"),
                                c = e(".mCSB_" + i.idx + "_scrollbar");
                            r.live && m(r.liveSelector || e(t).selector), j.call(this, "remove"), k.call(this), B.call(this), n.removeData(a), K(this, "mcs"), c.remove(), s.find("img." + d[2]).removeClass(d[2]), l.replaceWith(s.contents()), n.removeClass(o + " _" + a + "_" + i.idx + " " + d[6] + " " + d[7] + " " + d[5] + " " + d[3]).addClass(d[4])
                        }
                    })
                }
            },
            f = function() {
                return "object" != typeof e(this) || e(this).length < 1 ? n : this
            },
            h = function(t) {
                var o = ["rounded", "rounded-dark", "rounded-dots", "rounded-dots-dark"],
                    a = ["rounded-dots", "rounded-dots-dark", "3d", "3d-dark", "3d-thick", "3d-thick-dark", "inset", "inset-dark", "inset-2", "inset-2-dark", "inset-3", "inset-3-dark"],
                    n = ["minimal", "minimal-dark"],
                    i = ["minimal", "minimal-dark"],
                    r = ["minimal", "minimal-dark"];
                t.autoDraggerLength = e.inArray(t.theme, o) > -1 ? !1 : t.autoDraggerLength, t.autoExpandScrollbar = e.inArray(t.theme, a) > -1 ? !1 : t.autoExpandScrollbar, t.scrollButtons.enable = e.inArray(t.theme, n) > -1 ? !1 : t.scrollButtons.enable, t.autoHideScrollbar = e.inArray(t.theme, i) > -1 ? !0 : t.autoHideScrollbar, t.scrollbarPosition = e.inArray(t.theme, r) > -1 ? "outside" : t.scrollbarPosition
            },
            m = function(e) {
                l[e] && (clearTimeout(l[e]), K(l, e))
            },
            p = function(e) {
                return "yx" === e || "xy" === e || "auto" === e ? "yx" : "x" === e || "horizontal" === e ? "x" : "y"
            },
            g = function(e) {
                return "stepped" === e || "pixels" === e || "step" === e || "click" === e ? "stepped" : "stepless"
            },
            v = function() {
                var t = e(this),
                    n = t.data(a),
                    i = n.opt,
                    r = i.autoExpandScrollbar ? " " + d[1] + "_expand" : "",
                    l = ["<div id='mCSB_" + n.idx + "_scrollbar_vertical' class='mCSB_scrollTools mCSB_" + n.idx + "_scrollbar mCS-" + i.theme + " mCSB_scrollTools_vertical" + r + "'><div class='" + d[12] + "'><div id='mCSB_" + n.idx + "_dragger_vertical' class='mCSB_dragger' style='position:absolute;' oncontextmenu='return false;'><div class='mCSB_dragger_bar' /></div><div class='mCSB_draggerRail' /></div></div>", "<div id='mCSB_" + n.idx + "_scrollbar_horizontal' class='mCSB_scrollTools mCSB_" + n.idx + "_scrollbar mCS-" + i.theme + " mCSB_scrollTools_horizontal" + r + "'><div class='" + d[12] + "'><div id='mCSB_" + n.idx + "_dragger_horizontal' class='mCSB_dragger' style='position:absolute;' oncontextmenu='return false;'><div class='mCSB_dragger_bar' /></div><div class='mCSB_draggerRail' /></div></div>"],
                    s = "yx" === i.axis ? "mCSB_vertical_horizontal" : "x" === i.axis ? "mCSB_horizontal" : "mCSB_vertical",
                    c = "yx" === i.axis ? l[0] + l[1] : "x" === i.axis ? l[1] : l[0],
                    u = "yx" === i.axis ? "<div id='mCSB_" + n.idx + "_container_wrapper' class='mCSB_container_wrapper' />" : "",
                    f = i.autoHideScrollbar ? " " + d[6] : "",
                    h = "x" !== i.axis && "rtl" === n.langDir ? " " + d[7] : "";
                i.setWidth && t.css("width", i.setWidth), i.setHeight && t.css("height", i.setHeight), i.setLeft = "y" !== i.axis && "rtl" === n.langDir ? "989999px" : i.setLeft, t.addClass(o + " _" + a + "_" + n.idx + f + h).wrapInner("<div id='mCSB_" + n.idx + "' class='mCustomScrollBox mCS-" + i.theme + " " + s + "'><div id='mCSB_" + n.idx + "_container' class='mCSB_container' style='position:relative; top:" + i.setTop + "; left:" + i.setLeft + ";' dir=" + n.langDir + " /></div>");
                var m = e("#mCSB_" + n.idx),
                    p = e("#mCSB_" + n.idx + "_container");
                "y" === i.axis || i.advanced.autoExpandHorizontalScroll || p.css("width", x(p)), "outside" === i.scrollbarPosition ? ("static" === t.css("position") && t.css("position", "relative"), t.css("overflow", "visible"), m.addClass("mCSB_outside").after(c)) : (m.addClass("mCSB_inside").append(c), p.wrap(u)), w.call(this);
                var g = [e("#mCSB_" + n.idx + "_dragger_vertical"), e("#mCSB_" + n.idx + "_dragger_horizontal")];
                g[0].css("min-height", g[0].height()), g[1].css("min-width", g[1].width())
            },
            x = function(t) {
                var o = [t[0].scrollWidth, Math.max.apply(Math, t.children().map(function() {
                        return e(this).outerWidth(!0)
                    }).get())],
                    a = t.parent().width();
                return o[0] > a ? o[0] : o[1] > a ? o[1] : "100%"
            },
            _ = function() {
                var t = e(this),
                    o = t.data(a),
                    n = o.opt,
                    i = e("#mCSB_" + o.idx + "_container");
                if (n.advanced.autoExpandHorizontalScroll && "y" !== n.axis) {
                    i.css({
                        width: "auto",
                        "min-width": 0,
                        "overflow-x": "scroll"
                    });
                    var r = Math.ceil(i[0].scrollWidth);
                    3 === n.advanced.autoExpandHorizontalScroll || 2 !== n.advanced.autoExpandHorizontalScroll && r > i.parent().width() ? i.css({
                        width: r,
                        "min-width": "100%",
                        "overflow-x": "inherit"
                    }) : i.css({
                        "overflow-x": "inherit",
                        position: "absolute"
                    }).wrap("<div class='mCSB_h_wrapper' style='position:relative; left:0; width:999999px;' />").css({
                        width: Math.ceil(i[0].getBoundingClientRect().right + .4) - Math.floor(i[0].getBoundingClientRect().left),
                        "min-width": "100%",
                        position: "relative"
                    }).unwrap()
                }
            },
            w = function() {
                var t = e(this),
                    o = t.data(a),
                    n = o.opt,
                    i = e(".mCSB_" + o.idx + "_scrollbar:first"),
                    r = ee(n.scrollButtons.tabindex) ? "tabindex='" + n.scrollButtons.tabindex + "'" : "",
                    l = ["<a href='#' class='" + d[13] + "' oncontextmenu='return false;' " + r + " />", "<a href='#' class='" + d[14] + "' oncontextmenu='return false;' " + r + " />", "<a href='#' class='" + d[15] + "' oncontextmenu='return false;' " + r + " />", "<a href='#' class='" + d[16] + "' oncontextmenu='return false;' " + r + " />"],
                    s = ["x" === n.axis ? l[2] : l[0], "x" === n.axis ? l[3] : l[1], l[2], l[3]];
                n.scrollButtons.enable && i.prepend(s[0]).append(s[1]).next(".mCSB_scrollTools").prepend(s[2]).append(s[3])
            },
            S = function() {
                var t = e(this),
                    o = t.data(a),
                    n = e("#mCSB_" + o.idx),
                    i = e("#mCSB_" + o.idx + "_container"),
                    r = [e("#mCSB_" + o.idx + "_dragger_vertical"), e("#mCSB_" + o.idx + "_dragger_horizontal")],
                    l = [n.height() / i.outerHeight(!1), n.width() / i.outerWidth(!1)],
                    c = [parseInt(r[0].css("min-height")), Math.round(l[0] * r[0].parent().height()), parseInt(r[1].css("min-width")), Math.round(l[1] * r[1].parent().width())],
                    d = s && c[1] < c[0] ? c[0] : c[1],
                    u = s && c[3] < c[2] ? c[2] : c[3];
                r[0].css({
                    height: d,
                    "max-height": r[0].parent().height() - 10
                }).find(".mCSB_dragger_bar").css({
                    "line-height": c[0] + "px"
                }), r[1].css({
                    width: u,
                    "max-width": r[1].parent().width() - 10
                })
            },
            b = function() {
                var t = e(this),
                    o = t.data(a),
                    n = e("#mCSB_" + o.idx),
                    i = e("#mCSB_" + o.idx + "_container"),
                    r = [e("#mCSB_" + o.idx + "_dragger_vertical"), e("#mCSB_" + o.idx + "_dragger_horizontal")],
                    l = [i.outerHeight(!1) - n.height(), i.outerWidth(!1) - n.width()],
                    s = [l[0] / (r[0].parent().height() - r[0].height()), l[1] / (r[1].parent().width() - r[1].width())];
                o.scrollRatio = {
                    y: s[0],
                    x: s[1]
                }
            },
            C = function(e, t, o) {
                var a = o ? d[0] + "_expanded" : "",
                    n = e.closest(".mCSB_scrollTools");
                "active" === t ? (e.toggleClass(d[0] + " " + a), n.toggleClass(d[1]), e[0]._draggable = e[0]._draggable ? 0 : 1) : e[0]._draggable || ("hide" === t ? (e.removeClass(d[0]), n.removeClass(d[1])) : (e.addClass(d[0]), n.addClass(d[1])))
            },
            y = function() {
                var t = e(this),
                    o = t.data(a),
                    n = e("#mCSB_" + o.idx),
                    i = e("#mCSB_" + o.idx + "_container"),
                    r = null == o.overflowed ? i.height() : i.outerHeight(!1),
                    l = null == o.overflowed ? i.width() : i.outerWidth(!1),
                    s = i[0].scrollHeight,
                    c = i[0].scrollWidth;
                return s > r && (r = s), c > l && (l = c), [r > n.height(), l > n.width()]
            },
            B = function() {
                var t = e(this),
                    o = t.data(a),
                    n = o.opt,
                    i = e("#mCSB_" + o.idx),
                    r = e("#mCSB_" + o.idx + "_container"),
                    l = [e("#mCSB_" + o.idx + "_dragger_vertical"), e("#mCSB_" + o.idx + "_dragger_horizontal")];
                if (N(t), ("x" !== n.axis && !o.overflowed[0] || "y" === n.axis && o.overflowed[0]) && (l[0].add(r).css("top", 0), V(t, "_resetY")), "y" !== n.axis && !o.overflowed[1] || "x" === n.axis && o.overflowed[1]) {
                    var s = dx = 0;
                    "rtl" === o.langDir && (s = i.width() - r.outerWidth(!1), dx = Math.abs(s / o.scrollRatio.x)), r.css("left", s), l[1].css("left", dx), V(t, "_resetX")
                }
            },
            T = function() {
                function t() {
                    r = setTimeout(function() {
                        e.event.special.mousewheel ? (clearTimeout(r), E.call(o[0])) : t()
                    }, 100)
                }
                var o = e(this),
                    n = o.data(a),
                    i = n.opt;
                if (!n.bindEvents) {
                    if (I.call(this), i.contentTouchScroll && R.call(this), D.call(this), i.mouseWheel.enable) {
                        var r;
                        t()
                    }
                    z.call(this), P.call(this), i.advanced.autoScrollOnFocus && A.call(this), i.scrollButtons.enable && H.call(this), i.keyboard.enable && U.call(this), n.bindEvents = !0
                }
            },
            k = function() {
                var t = e(this),
                    o = t.data(a),
                    n = o.opt,
                    i = a + "_" + o.idx,
                    r = ".mCSB_" + o.idx + "_scrollbar",
                    l = e("#mCSB_" + o.idx + ",#mCSB_" + o.idx + "_container,#mCSB_" + o.idx + "_container_wrapper," + r + " ." + d[12] + ",#mCSB_" + o.idx + "_dragger_vertical,#mCSB_" + o.idx + "_dragger_horizontal," + r + ">a"),
                    s = e("#mCSB_" + o.idx + "_container");
                n.advanced.releaseDraggableSelectors && l.add(e(n.advanced.releaseDraggableSelectors)), o.bindEvents && (e(document).unbind("." + i), l.each(function() {
                    e(this).unbind("." + i)
                }), clearTimeout(t[0]._focusTimeout), K(t[0], "_focusTimeout"), clearTimeout(o.sequential.step), K(o.sequential, "step"), clearTimeout(s[0].onCompleteTimeout), K(s[0], "onCompleteTimeout"), o.bindEvents = !1)
            },
            M = function(t) {
                var o = e(this),
                    n = o.data(a),
                    i = n.opt,
                    r = e("#mCSB_" + n.idx + "_container_wrapper"),
                    l = r.length ? r : e("#mCSB_" + n.idx + "_container"),
                    s = [e("#mCSB_" + n.idx + "_scrollbar_vertical"), e("#mCSB_" + n.idx + "_scrollbar_horizontal")],
                    c = [s[0].find(".mCSB_dragger"), s[1].find(".mCSB_dragger")];
                "x" !== i.axis && (n.overflowed[0] && !t ? (s[0].add(c[0]).add(s[0].children("a")).css("display", "block"), l.removeClass(d[8] + " " + d[10])) : (i.alwaysShowScrollbar ? (2 !== i.alwaysShowScrollbar && c[0].css("display", "none"), l.removeClass(d[10])) : (s[0].css("display", "none"), l.addClass(d[10])), l.addClass(d[8]))), "y" !== i.axis && (n.overflowed[1] && !t ? (s[1].add(c[1]).add(s[1].children("a")).css("display", "block"), l.removeClass(d[9] + " " + d[11])) : (i.alwaysShowScrollbar ? (2 !== i.alwaysShowScrollbar && c[1].css("display", "none"), l.removeClass(d[11])) : (s[1].css("display", "none"), l.addClass(d[11])), l.addClass(d[9]))), n.overflowed[0] || n.overflowed[1] ? o.removeClass(d[5]) : o.addClass(d[5])
            },
            O = function(e) {
                var t = e.type;
                switch (t) {
                    case "pointerdown":
                    case "MSPointerDown":
                    case "pointermove":
                    case "MSPointerMove":
                    case "pointerup":
                    case "MSPointerUp":
                        return e.target.ownerDocument !== document ? [e.originalEvent.screenY, e.originalEvent.screenX, !1] : [e.originalEvent.pageY, e.originalEvent.pageX, !1];
                    case "touchstart":
                    case "touchmove":
                    case "touchend":
                        var o = e.originalEvent.touches[0] || e.originalEvent.changedTouches[0],
                            a = e.originalEvent.touches.length || e.originalEvent.changedTouches.length;
                        return e.target.ownerDocument !== document ? [o.screenY, o.screenX, a > 1] : [o.pageY, o.pageX, a > 1];
                    default:
                        return [e.pageY, e.pageX, !1]
                }
            },
            I = function() {
                function t(e) {
                    var t = m.find("iframe");
                    if (t.length) {
                        var o = e ? "auto" : "none";
                        t.css("pointer-events", o)
                    }
                }

                function o(e, t, o, a) {
                    if (m[0].idleTimer = u.scrollInertia < 233 ? 250 : 0, n.attr("id") === h[1]) var i = "x",
                        r = (n[0].offsetLeft - t + a) * d.scrollRatio.x;
                    else var i = "y",
                        r = (n[0].offsetTop - e + o) * d.scrollRatio.y;
                    V(l, r.toString(), {
                        dir: i,
                        drag: !0
                    })
                }
                var n, i, r, l = e(this),
                    d = l.data(a),
                    u = d.opt,
                    f = a + "_" + d.idx,
                    h = ["mCSB_" + d.idx + "_dragger_vertical", "mCSB_" + d.idx + "_dragger_horizontal"],
                    m = e("#mCSB_" + d.idx + "_container"),
                    p = e("#" + h[0] + ",#" + h[1]),
                    g = u.advanced.releaseDraggableSelectors ? p.add(e(u.advanced.releaseDraggableSelectors)) : p;
                p.bind("mousedown." + f + " touchstart." + f + " pointerdown." + f + " MSPointerDown." + f, function(o) {
                    if (o.stopImmediatePropagation(), o.preventDefault(), Z(o)) {
                        c = !0, s && (document.onselectstart = function() {
                            return !1
                        }), t(!1), N(l), n = e(this);
                        var a = n.offset(),
                            d = O(o)[0] - a.top,
                            f = O(o)[1] - a.left,
                            h = n.height() + a.top,
                            m = n.width() + a.left;
                        h > d && d > 0 && m > f && f > 0 && (i = d, r = f), C(n, "active", u.autoExpandScrollbar)
                    }
                }).bind("touchmove." + f, function(e) {
                    e.stopImmediatePropagation(), e.preventDefault();
                    var t = n.offset(),
                        a = O(e)[0] - t.top,
                        l = O(e)[1] - t.left;
                    o(i, r, a, l)
                }), e(document).bind("mousemove." + f + " pointermove." + f + " MSPointerMove." + f, function(e) {
                    if (n) {
                        var t = n.offset(),
                            a = O(e)[0] - t.top,
                            l = O(e)[1] - t.left;
                        if (i === a) return;
                        o(i, r, a, l)
                    }
                }).add(g).bind("mouseup." + f + " touchend." + f + " pointerup." + f + " MSPointerUp." + f, function(e) {
                    n && (C(n, "active", u.autoExpandScrollbar), n = null), c = !1, s && (document.onselectstart = null), t(!0)
                })
            },
            R = function() {
                function o(e) {
                    if (!$(e) || c || O(e)[2]) return void(t = 0);
                    t = 1, b = 0, C = 0, d = 1, y.removeClass("mCS_touch_action");
                    var o = I.offset();
                    u = O(e)[0] - o.top, f = O(e)[1] - o.left, A = [O(e)[0], O(e)[1]]
                }

                function n(e) {
                    if ($(e) && !c && !O(e)[2] && (e.stopImmediatePropagation(), (!C || b) && d)) {
                        g = G();
                        var t = M.offset(),
                            o = O(e)[0] - t.top,
                            a = O(e)[1] - t.left,
                            n = "mcsLinearOut";
                        if (D.push(o), E.push(a), A[2] = Math.abs(O(e)[0] - A[0]), A[3] = Math.abs(O(e)[1] - A[1]), B.overflowed[0]) var i = R[0].parent().height() - R[0].height(),
                            r = u - o > 0 && o - u > -(i * B.scrollRatio.y) && (2 * A[3] < A[2] || "yx" === T.axis);
                        if (B.overflowed[1]) var l = R[1].parent().width() - R[1].width(),
                            h = f - a > 0 && a - f > -(l * B.scrollRatio.x) && (2 * A[2] < A[3] || "yx" === T.axis);
                        r || h ? (U || e.preventDefault(), b = 1) : (C = 1, y.addClass("mCS_touch_action")), U && e.preventDefault(), w = "yx" === T.axis ? [u - o, f - a] : "x" === T.axis ? [null, f - a] : [u - o, null], I[0].idleTimer = 250, B.overflowed[0] && s(w[0], L, n, "y", "all", !0), B.overflowed[1] && s(w[1], L, n, "x", z, !0)
                    }
                }

                function i(e) {
                    if (!$(e) || c || O(e)[2]) return void(t = 0);
                    t = 1, e.stopImmediatePropagation(), N(y), p = G();
                    var o = M.offset();
                    h = O(e)[0] - o.top, m = O(e)[1] - o.left, D = [], E = []
                }

                function r(e) {
                    if ($(e) && !c && !O(e)[2]) {
                        d = 0, e.stopImmediatePropagation(), b = 0, C = 0, v = G();
                        var t = M.offset(),
                            o = O(e)[0] - t.top,
                            a = O(e)[1] - t.left;
                        if (!(v - g > 30)) {
                            _ = 1e3 / (v - p);
                            var n = "mcsEaseOut",
                                i = 2.5 > _,
                                r = i ? [D[D.length - 2], E[E.length - 2]] : [0, 0];
                            x = i ? [o - r[0], a - r[1]] : [o - h, a - m];
                            var u = [Math.abs(x[0]), Math.abs(x[1])];
                            _ = i ? [Math.abs(x[0] / 4), Math.abs(x[1] / 4)] : [_, _];
                            var f = [Math.abs(I[0].offsetTop) - x[0] * l(u[0] / _[0], _[0]), Math.abs(I[0].offsetLeft) - x[1] * l(u[1] / _[1], _[1])];
                            w = "yx" === T.axis ? [f[0], f[1]] : "x" === T.axis ? [null, f[1]] : [f[0], null], S = [4 * u[0] + T.scrollInertia, 4 * u[1] + T.scrollInertia];
                            var y = parseInt(T.contentTouchScroll) || 0;
                            w[0] = u[0] > y ? w[0] : 0, w[1] = u[1] > y ? w[1] : 0, B.overflowed[0] && s(w[0], S[0], n, "y", z, !1), B.overflowed[1] && s(w[1], S[1], n, "x", z, !1)
                        }
                    }
                }

                function l(e, t) {
                    var o = [1.5 * t, 2 * t, t / 1.5, t / 2];
                    return e > 90 ? t > 4 ? o[0] : o[3] : e > 60 ? t > 3 ? o[3] : o[2] : e > 30 ? t > 8 ? o[1] : t > 6 ? o[0] : t > 4 ? t : o[2] : t > 8 ? t : o[3]
                }

                function s(e, t, o, a, n, i) {
                    e && V(y, e.toString(), {
                        dur: t,
                        scrollEasing: o,
                        dir: a,
                        overwrite: n,
                        drag: i
                    })
                }
                var d, u, f, h, m, p, g, v, x, _, w, S, b, C, y = e(this),
                    B = y.data(a),
                    T = B.opt,
                    k = a + "_" + B.idx,
                    M = e("#mCSB_" + B.idx),
                    I = e("#mCSB_" + B.idx + "_container"),
                    R = [e("#mCSB_" + B.idx + "_dragger_vertical"), e("#mCSB_" + B.idx + "_dragger_horizontal")],
                    D = [],
                    E = [],
                    L = 0,
                    z = "yx" === T.axis ? "none" : "all",
                    A = [],
                    P = I.find("iframe"),
                    H = ["touchstart." + k + " pointerdown." + k + " MSPointerDown." + k, "touchmove." + k + " pointermove." + k + " MSPointerMove." + k, "touchend." + k + " pointerup." + k + " MSPointerUp." + k],
                    U = void 0 !== document.body.style.touchAction;
                I.bind(H[0], function(e) {
                    o(e)
                }).bind(H[1], function(e) {
                    n(e)
                }), M.bind(H[0], function(e) {
                    i(e)
                }).bind(H[2], function(e) {
                    r(e)
                }), P.length && P.each(function() {
                    e(this).load(function() {
                        W(this) && e(this.contentDocument || this.contentWindow.document).bind(H[0], function(e) {
                            o(e), i(e)
                        }).bind(H[1], function(e) {
                            n(e)
                        }).bind(H[2], function(e) {
                            r(e)
                        })
                    })
                })
            },
            D = function() {
                function o() {
                    return window.getSelection ? window.getSelection().toString() : document.selection && "Control" != document.selection.type ? document.selection.createRange().text : 0
                }

                function n(e, t, o) {
                    d.type = o && i ? "stepped" : "stepless", d.scrollAmount = 10, F(r, e, t, "mcsLinearOut", o ? 60 : null)
                }
                var i, r = e(this),
                    l = r.data(a),
                    s = l.opt,
                    d = l.sequential,
                    u = a + "_" + l.idx,
                    f = e("#mCSB_" + l.idx + "_container"),
                    h = f.parent();
                f.bind("mousedown." + u, function(e) {
                    t || i || (i = 1, c = !0)
                }).add(document).bind("mousemove." + u, function(e) {
                    if (!t && i && o()) {
                        var a = f.offset(),
                            r = O(e)[0] - a.top + f[0].offsetTop,
                            c = O(e)[1] - a.left + f[0].offsetLeft;
                        r > 0 && r < h.height() && c > 0 && c < h.width() ? d.step && n("off", null, "stepped") : ("x" !== s.axis && l.overflowed[0] && (0 > r ? n("on", 38) : r > h.height() && n("on", 40)), "y" !== s.axis && l.overflowed[1] && (0 > c ? n("on", 37) : c > h.width() && n("on", 39)))
                    }
                }).bind("mouseup." + u + " dragend." + u, function(e) {
                    t || (i && (i = 0, n("off", null)), c = !1)
                })
            },
            E = function() {
                function t(t, a) {
                    if (N(o), !L(o, t.target)) {
                        var r = "auto" !== i.mouseWheel.deltaFactor ? parseInt(i.mouseWheel.deltaFactor) : s && t.deltaFactor < 100 ? 100 : t.deltaFactor || 100;
                        if ("x" === i.axis || "x" === i.mouseWheel.axis) var d = "x",
                            u = [Math.round(r * n.scrollRatio.x), parseInt(i.mouseWheel.scrollAmount)],
                            f = "auto" !== i.mouseWheel.scrollAmount ? u[1] : u[0] >= l.width() ? .9 * l.width() : u[0],
                            h = Math.abs(e("#mCSB_" + n.idx + "_container")[0].offsetLeft),
                            m = c[1][0].offsetLeft,
                            p = c[1].parent().width() - c[1].width(),
                            g = t.deltaX || t.deltaY || a;
                        else var d = "y",
                            u = [Math.round(r * n.scrollRatio.y), parseInt(i.mouseWheel.scrollAmount)],
                            f = "auto" !== i.mouseWheel.scrollAmount ? u[1] : u[0] >= l.height() ? .9 * l.height() : u[0],
                            h = Math.abs(e("#mCSB_" + n.idx + "_container")[0].offsetTop),
                            m = c[0][0].offsetTop,
                            p = c[0].parent().height() - c[0].height(),
                            g = t.deltaY || a;
                        "y" === d && !n.overflowed[0] || "x" === d && !n.overflowed[1] || ((i.mouseWheel.invert || t.webkitDirectionInvertedFromDevice) && (g = -g), i.mouseWheel.normalizeDelta && (g = 0 > g ? -1 : 1), (g > 0 && 0 !== m || 0 > g && m !== p || i.mouseWheel.preventDefault) && (t.stopImmediatePropagation(), t.preventDefault()), V(o, (h - g * f).toString(), {
                            dir: d
                        }))
                    }
                }
                if (e(this).data(a)) {
                    var o = e(this),
                        n = o.data(a),
                        i = n.opt,
                        r = a + "_" + n.idx,
                        l = e("#mCSB_" + n.idx),
                        c = [e("#mCSB_" + n.idx + "_dragger_vertical"), e("#mCSB_" + n.idx + "_dragger_horizontal")],
                        d = e("#mCSB_" + n.idx + "_container").find("iframe");
                    d.length && d.each(function() {
                        e(this).load(function() {
                            W(this) && e(this.contentDocument || this.contentWindow.document).bind("mousewheel." + r, function(e, o) {
                                t(e, o)
                            })
                        })
                    }), l.bind("mousewheel." + r, function(e, o) {
                        t(e, o)
                    })
                }
            },
            W = function(e) {
                var t = null;
                try {
                    var o = e.contentDocument || e.contentWindow.document;
                    t = o.body.innerHTML
                } catch (a) {}
                return null !== t
            },
            L = function(t, o) {
                var n = o.nodeName.toLowerCase(),
                    i = t.data(a).opt.mouseWheel.disableOver,
                    r = ["select", "textarea"];
                return e.inArray(n, i) > -1 && !(e.inArray(n, r) > -1 && !e(o).is(":focus"))
            },
            z = function() {
                var t = e(this),
                    o = t.data(a),
                    n = a + "_" + o.idx,
                    i = e("#mCSB_" + o.idx + "_container"),
                    r = i.parent(),
                    l = e(".mCSB_" + o.idx + "_scrollbar ." + d[12]);
                l.bind("touchstart." + n + " pointerdown." + n + " MSPointerDown." + n, function(e) {
                    c = !0
                }).bind("touchend." + n + " pointerup." + n + " MSPointerUp." + n, function(e) {
                    c = !1
                }).bind("click." + n, function(a) {
                    if (e(a.target).hasClass(d[12]) || e(a.target).hasClass("mCSB_draggerRail")) {
                        N(t);
                        var n = e(this),
                            l = n.find(".mCSB_dragger");
                        if (n.parent(".mCSB_scrollTools_horizontal").length > 0) {
                            if (!o.overflowed[1]) return;
                            var s = "x",
                                c = a.pageX > l.offset().left ? -1 : 1,
                                u = Math.abs(i[0].offsetLeft) - .9 * c * r.width()
                        } else {
                            if (!o.overflowed[0]) return;
                            var s = "y",
                                c = a.pageY > l.offset().top ? -1 : 1,
                                u = Math.abs(i[0].offsetTop) - .9 * c * r.height()
                        }
                        V(t, u.toString(), {
                            dir: s,
                            scrollEasing: "mcsEaseInOut"
                        })
                    }
                })
            },
            A = function() {
                var t = e(this),
                    o = t.data(a),
                    n = o.opt,
                    i = a + "_" + o.idx,
                    r = e("#mCSB_" + o.idx + "_container"),
                    l = r.parent();
                r.bind("focusin." + i, function(o) {
                    var a = e(document.activeElement),
                        i = r.find(".mCustomScrollBox").length,
                        s = 0;
                    a.is(n.advanced.autoScrollOnFocus) && (N(t), clearTimeout(t[0]._focusTimeout), t[0]._focusTimer = i ? (s + 17) * i : 0, t[0]._focusTimeout = setTimeout(function() {
                        var e = [te(a)[0], te(a)[1]],
                            o = [r[0].offsetTop, r[0].offsetLeft],
                            i = [o[0] + e[0] >= 0 && o[0] + e[0] < l.height() - a.outerHeight(!1), o[1] + e[1] >= 0 && o[0] + e[1] < l.width() - a.outerWidth(!1)],
                            c = "yx" !== n.axis || i[0] || i[1] ? "all" : "none";
                        "x" === n.axis || i[0] || V(t, e[0].toString(), {
                            dir: "y",
                            scrollEasing: "mcsEaseInOut",
                            overwrite: c,
                            dur: s
                        }), "y" === n.axis || i[1] || V(t, e[1].toString(), {
                            dir: "x",
                            scrollEasing: "mcsEaseInOut",
                            overwrite: c,
                            dur: s
                        })
                    }, t[0]._focusTimer))
                })
            },
            P = function() {
                var t = e(this),
                    o = t.data(a),
                    n = a + "_" + o.idx,
                    i = e("#mCSB_" + o.idx + "_container").parent();
                i.bind("scroll." + n, function(t) {
                    (0 !== i.scrollTop() || 0 !== i.scrollLeft()) && e(".mCSB_" + o.idx + "_scrollbar").css("visibility", "hidden")
                })
            },
            H = function() {
                var t = e(this),
                    o = t.data(a),
                    n = o.opt,
                    i = o.sequential,
                    r = a + "_" + o.idx,
                    l = ".mCSB_" + o.idx + "_scrollbar",
                    s = e(l + ">a");
                s.bind("mousedown." + r + " touchstart." + r + " pointerdown." + r + " MSPointerDown." + r + " mouseup." + r + " touchend." + r + " pointerup." + r + " MSPointerUp." + r + " mouseout." + r + " pointerout." + r + " MSPointerOut." + r + " click." + r, function(a) {
                    function r(e, o) {
                        i.scrollAmount = n.snapAmount || n.scrollButtons.scrollAmount, F(t, e, o)
                    }
                    if (a.preventDefault(), Z(a)) {
                        var l = e(this).attr("class");
                        switch (i.type = n.scrollButtons.scrollType, a.type) {
                            case "mousedown":
                            case "touchstart":
                            case "pointerdown":
                            case "MSPointerDown":
                                if ("stepped" === i.type) return;
                                c = !0, o.tweenRunning = !1, r("on", l);
                                break;
                            case "mouseup":
                            case "touchend":
                            case "pointerup":
                            case "MSPointerUp":
                            case "mouseout":
                            case "pointerout":
                            case "MSPointerOut":
                                if ("stepped" === i.type) return;
                                c = !1, i.dir && r("off", l);
                                break;
                            case "click":
                                if ("stepped" !== i.type || o.tweenRunning) return;
                                r("on", l)
                        }
                    }
                })
            },
            U = function() {
                function t(t) {
                    function a(e, t) {
                        r.type = i.keyboard.scrollType, r.scrollAmount = i.snapAmount || i.keyboard.scrollAmount, "stepped" === r.type && n.tweenRunning || F(o, e, t)
                    }
                    switch (t.type) {
                        case "blur":
                            n.tweenRunning && r.dir && a("off", null);
                            break;
                        case "keydown":
                        case "keyup":
                            var l = t.keyCode ? t.keyCode : t.which,
                                s = "on";
                            if ("x" !== i.axis && (38 === l || 40 === l) || "y" !== i.axis && (37 === l || 39 === l)) {
                                if ((38 === l || 40 === l) && !n.overflowed[0] || (37 === l || 39 === l) && !n.overflowed[1]) return;
                                "keyup" === t.type && (s = "off"), e(document.activeElement).is(u) || (t.preventDefault(), t.stopImmediatePropagation(), a(s, l))
                            } else if (33 === l || 34 === l) {
                                if ((n.overflowed[0] || n.overflowed[1]) && (t.preventDefault(), t.stopImmediatePropagation()), "keyup" === t.type) {
                                    N(o);
                                    var f = 34 === l ? -1 : 1;
                                    if ("x" === i.axis || "yx" === i.axis && n.overflowed[1] && !n.overflowed[0]) var h = "x",
                                        m = Math.abs(c[0].offsetLeft) - .9 * f * d.width();
                                    else var h = "y",
                                        m = Math.abs(c[0].offsetTop) - .9 * f * d.height();
                                    V(o, m.toString(), {
                                        dir: h,
                                        scrollEasing: "mcsEaseInOut"
                                    })
                                }
                            } else if ((35 === l || 36 === l) && !e(document.activeElement).is(u) && ((n.overflowed[0] || n.overflowed[1]) && (t.preventDefault(), t.stopImmediatePropagation()), "keyup" === t.type)) {
                                if ("x" === i.axis || "yx" === i.axis && n.overflowed[1] && !n.overflowed[0]) var h = "x",
                                    m = 35 === l ? Math.abs(d.width() - c.outerWidth(!1)) : 0;
                                else var h = "y",
                                    m = 35 === l ? Math.abs(d.height() - c.outerHeight(!1)) : 0;
                                V(o, m.toString(), {
                                    dir: h,
                                    scrollEasing: "mcsEaseInOut"
                                })
                            }
                    }
                }
                var o = e(this),
                    n = o.data(a),
                    i = n.opt,
                    r = n.sequential,
                    l = a + "_" + n.idx,
                    s = e("#mCSB_" + n.idx),
                    c = e("#mCSB_" + n.idx + "_container"),
                    d = c.parent(),
                    u = "input,textarea,select,datalist,keygen,[contenteditable='true']",
                    f = c.find("iframe"),
                    h = ["blur." + l + " keydown." + l + " keyup." + l];
                f.length && f.each(function() {
                    e(this).load(function() {
                        W(this) && e(this.contentDocument || this.contentWindow.document).bind(h[0], function(e) {
                            t(e)
                        })
                    })
                }), s.attr("tabindex", "0").bind(h[0], function(e) {
                    t(e)
                })
            },
            F = function(t, o, n, i, r) {
                function l(e) {
                    var o = "stepped" !== f.type,
                        a = r ? r : e ? o ? p / 1.5 : g : 1e3 / 60,
                        n = e ? o ? 7.5 : 40 : 2.5,
                        s = [Math.abs(h[0].offsetTop), Math.abs(h[0].offsetLeft)],
                        d = [c.scrollRatio.y > 10 ? 10 : c.scrollRatio.y, c.scrollRatio.x > 10 ? 10 : c.scrollRatio.x],
                        u = "x" === f.dir[0] ? s[1] + f.dir[1] * d[1] * n : s[0] + f.dir[1] * d[0] * n,
                        m = "x" === f.dir[0] ? s[1] + f.dir[1] * parseInt(f.scrollAmount) : s[0] + f.dir[1] * parseInt(f.scrollAmount),
                        v = "auto" !== f.scrollAmount ? m : u,
                        x = i ? i : e ? o ? "mcsLinearOut" : "mcsEaseInOut" : "mcsLinear",
                        _ = e ? !0 : !1;
                    return e && 17 > a && (v = "x" === f.dir[0] ? s[1] : s[0]), V(t, v.toString(), {
                        dir: f.dir[0],
                        scrollEasing: x,
                        dur: a,
                        onComplete: _
                    }), e ? void(f.dir = !1) : (clearTimeout(f.step), void(f.step = setTimeout(function() {
                        l()
                    }, a)))
                }

                function s() {
                    clearTimeout(f.step), K(f, "step"), N(t)
                }
                var c = t.data(a),
                    u = c.opt,
                    f = c.sequential,
                    h = e("#mCSB_" + c.idx + "_container"),
                    m = "stepped" === f.type ? !0 : !1,
                    p = u.scrollInertia < 26 ? 26 : u.scrollInertia,
                    g = u.scrollInertia < 1 ? 17 : u.scrollInertia;
                switch (o) {
                    case "on":
                        if (f.dir = [n === d[16] || n === d[15] || 39 === n || 37 === n ? "x" : "y", n === d[13] || n === d[15] || 38 === n || 37 === n ? -1 : 1], N(t), ee(n) && "stepped" === f.type) return;
                        l(m);
                        break;
                    case "off":
                        s(), (m || c.tweenRunning && f.dir) && l(!0)
                }
            },
            q = function(t) {
                var o = e(this).data(a).opt,
                    n = [];
                return "function" == typeof t && (t = t()), t instanceof Array ? n = t.length > 1 ? [t[0], t[1]] : "x" === o.axis ? [null, t[0]] : [t[0], null] : (n[0] = t.y ? t.y : t.x || "x" === o.axis ? null : t, n[1] = t.x ? t.x : t.y || "y" === o.axis ? null : t), "function" == typeof n[0] && (n[0] = n[0]()), "function" == typeof n[1] && (n[1] = n[1]()), n
            },
            Y = function(t, o) {
                if (null != t && "undefined" != typeof t) {
                    var n = e(this),
                        i = n.data(a),
                        r = i.opt,
                        l = e("#mCSB_" + i.idx + "_container"),
                        s = l.parent(),
                        c = typeof t;
                    o || (o = "x" === r.axis ? "x" : "y");
                    var d = "x" === o ? l.outerWidth(!1) : l.outerHeight(!1),
                        f = "x" === o ? l[0].offsetLeft : l[0].offsetTop,
                        h = "x" === o ? "left" : "top";
                    switch (c) {
                        case "function":
                            return t();
                        case "object":
                            var m = t.jquery ? t : e(t);
                            if (!m.length) return;
                            return "x" === o ? te(m)[1] : te(m)[0];
                        case "string":
                        case "number":
                            if (ee(t)) return Math.abs(t);
                            if (-1 !== t.indexOf("%")) return Math.abs(d * parseInt(t) / 100);
                            if (-1 !== t.indexOf("-=")) return Math.abs(f - parseInt(t.split("-=")[1]));
                            if (-1 !== t.indexOf("+=")) {
                                var p = f + parseInt(t.split("+=")[1]);
                                return p >= 0 ? 0 : Math.abs(p)
                            }
                            if (-1 !== t.indexOf("px") && ee(t.split("px")[0])) return Math.abs(t.split("px")[0]);
                            if ("top" === t || "left" === t) return 0;
                            if ("bottom" === t) return Math.abs(s.height() - l.outerHeight(!1));
                            if ("right" === t) return Math.abs(s.width() - l.outerWidth(!1));
                            if ("first" === t || "last" === t) {
                                var m = l.find(":" + t);
                                return "x" === o ? te(m)[1] : te(m)[0]
                            }
                            return e(t).length ? "x" === o ? te(e(t))[1] : te(e(t))[0] : (l.css(h, t), void u.update.call(null, n[0]))
                    }
                }
            },
            j = function(t) {
                function o() {
                    return clearTimeout(f[0].autoUpdate), 0 === l.parents("html").length ? void(l = null) : void(f[0].autoUpdate = setTimeout(function() {
                        return c.advanced.updateOnSelectorChange && (s.poll.change.n = i(), s.poll.change.n !== s.poll.change.o) ? (s.poll.change.o = s.poll.change.n, void r(3)) : c.advanced.updateOnContentResize && (s.poll.size.n = l[0].scrollHeight + l[0].scrollWidth + f[0].offsetHeight + l[0].offsetHeight, s.poll.size.n !== s.poll.size.o) ? (s.poll.size.o = s.poll.size.n, void r(1)) : !c.advanced.updateOnImageLoad || "auto" === c.advanced.updateOnImageLoad && "y" === c.axis || (s.poll.img.n = f.find("img").length, s.poll.img.n === s.poll.img.o) ? void((c.advanced.updateOnSelectorChange || c.advanced.updateOnContentResize || c.advanced.updateOnImageLoad) && o()) : (s.poll.img.o = s.poll.img.n, void f.find("img").each(function() {
                            n(this)
                        }))
                    }, c.advanced.autoUpdateTimeout))
                }

                function n(t) {
                    function o(e, t) {
                        return function() {
                            return t.apply(e, arguments)
                        }
                    }

                    function a() {
                        this.onload = null, e(t).addClass(d[2]), r(2)
                    }
                    if (e(t).hasClass(d[2])) return void r();
                    var n = new Image;
                    n.onload = o(n, a), n.src = t.src
                }

                function i() {
                    c.advanced.updateOnSelectorChange === !0 && (c.advanced.updateOnSelectorChange = "*");
                    var e = 0,
                        t = f.find(c.advanced.updateOnSelectorChange);
                    return c.advanced.updateOnSelectorChange && t.length > 0 && t.each(function() {
                        e += this.offsetHeight + this.offsetWidth
                    }), e
                }

                function r(e) {
                    clearTimeout(f[0].autoUpdate), u.update.call(null, l[0], e)
                }
                var l = e(this),
                    s = l.data(a),
                    c = s.opt,
                    f = e("#mCSB_" + s.idx + "_container");
                return t ? (clearTimeout(f[0].autoUpdate), void K(f[0], "autoUpdate")) : void o()
            },
            X = function(e, t, o) {
                return Math.round(e / t) * t - o
            },
            N = function(t) {
                var o = t.data(a),
                    n = e("#mCSB_" + o.idx + "_container,#mCSB_" + o.idx + "_container_wrapper,#mCSB_" + o.idx + "_dragger_vertical,#mCSB_" + o.idx + "_dragger_horizontal");
                n.each(function() {
                    J.call(this)
                })
            },
            V = function(t, o, n) {
                function i(e) {
                    return s && c.callbacks[e] && "function" == typeof c.callbacks[e]
                }

                function r() {
                    return [c.callbacks.alwaysTriggerOffsets || _ >= w[0] + b, c.callbacks.alwaysTriggerOffsets || -y >= _]
                }

                function l() {
                    var e = [h[0].offsetTop, h[0].offsetLeft],
                        o = [v[0].offsetTop, v[0].offsetLeft],
                        a = [h.outerHeight(!1), h.outerWidth(!1)],
                        i = [f.height(), f.width()];
                    t[0].mcs = {
                        content: h,
                        top: e[0],
                        left: e[1],
                        draggerTop: o[0],
                        draggerLeft: o[1],
                        topPct: Math.round(100 * Math.abs(e[0]) / (Math.abs(a[0]) - i[0])),
                        leftPct: Math.round(100 * Math.abs(e[1]) / (Math.abs(a[1]) - i[1])),
                        direction: n.dir
                    }
                }
                var s = t.data(a),
                    c = s.opt,
                    d = {
                        trigger: "internal",
                        dir: "y",
                        scrollEasing: "mcsEaseOut",
                        drag: !1,
                        dur: c.scrollInertia,
                        overwrite: "all",
                        callbacks: !0,
                        onStart: !0,
                        onUpdate: !0,
                        onComplete: !0
                    },
                    n = e.extend(d, n),
                    u = [n.dur, n.drag ? 0 : n.dur],
                    f = e("#mCSB_" + s.idx),
                    h = e("#mCSB_" + s.idx + "_container"),
                    m = h.parent(),
                    p = c.callbacks.onTotalScrollOffset ? q.call(t, c.callbacks.onTotalScrollOffset) : [0, 0],
                    g = c.callbacks.onTotalScrollBackOffset ? q.call(t, c.callbacks.onTotalScrollBackOffset) : [0, 0];
                if (s.trigger = n.trigger, (0 !== m.scrollTop() || 0 !== m.scrollLeft()) && (e(".mCSB_" + s.idx + "_scrollbar").css("visibility", "visible"), m.scrollTop(0).scrollLeft(0)), "_resetY" !== o || s.contentReset.y || (i("onOverflowYNone") && c.callbacks.onOverflowYNone.call(t[0]), s.contentReset.y = 1), "_resetX" !== o || s.contentReset.x || (i("onOverflowXNone") && c.callbacks.onOverflowXNone.call(t[0]), s.contentReset.x = 1), "_resetY" !== o && "_resetX" !== o) {
                    switch (!s.contentReset.y && t[0].mcs || !s.overflowed[0] || (i("onOverflowY") && c.callbacks.onOverflowY.call(t[0]), s.contentReset.x = null), !s.contentReset.x && t[0].mcs || !s.overflowed[1] || (i("onOverflowX") && c.callbacks.onOverflowX.call(t[0]), s.contentReset.x = null), c.snapAmount && (o = X(o, c.snapAmount, c.snapOffset)), n.dir) {
                        case "x":
                            var v = e("#mCSB_" + s.idx + "_dragger_horizontal"),
                                x = "left",
                                _ = h[0].offsetLeft,
                                w = [f.width() - h.outerWidth(!1), v.parent().width() - v.width()],
                                S = [o, 0 === o ? 0 : o / s.scrollRatio.x],
                                b = p[1],
                                y = g[1],
                                B = b > 0 ? b / s.scrollRatio.x : 0,
                                T = y > 0 ? y / s.scrollRatio.x : 0;
                            break;
                        case "y":
                            var v = e("#mCSB_" + s.idx + "_dragger_vertical"),
                                x = "top",
                                _ = h[0].offsetTop,
                                w = [f.height() - h.outerHeight(!1), v.parent().height() - v.height()],
                                S = [o, 0 === o ? 0 : o / s.scrollRatio.y],
                                b = p[0],
                                y = g[0],
                                B = b > 0 ? b / s.scrollRatio.y : 0,
                                T = y > 0 ? y / s.scrollRatio.y : 0
                    }
                    S[1] < 0 || 0 === S[0] && 0 === S[1] ? S = [0, 0] : S[1] >= w[1] ? S = [w[0], w[1]] : S[0] = -S[0], t[0].mcs || (l(), i("onInit") && c.callbacks.onInit.call(t[0])), clearTimeout(h[0].onCompleteTimeout), (s.tweenRunning || !(0 === _ && S[0] >= 0 || _ === w[0] && S[0] <= w[0])) && (Q(v[0], x, Math.round(S[1]), u[1], n.scrollEasing), Q(h[0], x, Math.round(S[0]), u[0], n.scrollEasing, n.overwrite, {
                        onStart: function() {
                            n.callbacks && n.onStart && !s.tweenRunning && (i("onScrollStart") && (l(), c.callbacks.onScrollStart.call(t[0])), s.tweenRunning = !0, C(v), s.cbOffsets = r())
                        },
                        onUpdate: function() {
                            n.callbacks && n.onUpdate && i("whileScrolling") && (l(), c.callbacks.whileScrolling.call(t[0]))
                        },
                        onComplete: function() {
                            if (n.callbacks && n.onComplete) {
                                "yx" === c.axis && clearTimeout(h[0].onCompleteTimeout);
                                var e = h[0].idleTimer || 0;
                                h[0].onCompleteTimeout = setTimeout(function() {
                                    i("onScroll") && (l(), c.callbacks.onScroll.call(t[0])), i("onTotalScroll") && S[1] >= w[1] - B && s.cbOffsets[0] && (l(), c.callbacks.onTotalScroll.call(t[0])), i("onTotalScrollBack") && S[1] <= T && s.cbOffsets[1] && (l(), c.callbacks.onTotalScrollBack.call(t[0])), s.tweenRunning = !1, h[0].idleTimer = 0, C(v, "hide")
                                }, e)
                            }
                        }
                    }))
                }
            },
            Q = function(e, t, o, a, n, i, r) {
                function l() {
                    S.stop || (x || m.call(), x = G() - v, s(), x >= S.time && (S.time = x > S.time ? x + f - (x - S.time) : x + f - 1, S.time < x + 1 && (S.time = x + 1)), S.time < a ? S.id = h(l) : g.call())
                }

                function s() {
                    a > 0 ? (S.currVal = u(S.time, _, b, a, n), w[t] = Math.round(S.currVal) + "px") : w[t] = o + "px", p.call()
                }

                function c() {
                    f = 1e3 / 60, S.time = x + f, h = window.requestAnimationFrame ? window.requestAnimationFrame : function(e) {
                        return s(), setTimeout(e, .01)
                    }, S.id = h(l)
                }

                function d() {
                    null != S.id && (window.requestAnimationFrame ? window.cancelAnimationFrame(S.id) : clearTimeout(S.id), S.id = null)
                }

                function u(e, t, o, a, n) {
                    switch (n) {
                        case "linear":
                        case "mcsLinear":
                            return o * e / a + t;
                        case "mcsLinearOut":
                            return e /= a, e--, o * Math.sqrt(1 - e * e) + t;
                        case "easeInOutSmooth":
                            return e /= a / 2, 1 > e ? o / 2 * e * e + t : (e--, -o / 2 * (e * (e - 2) - 1) + t);
                        case "easeInOutStrong":
                            return e /= a / 2, 1 > e ? o / 2 * Math.pow(2, 10 * (e - 1)) + t : (e--, o / 2 * (-Math.pow(2, -10 * e) + 2) + t);
                        case "easeInOut":
                        case "mcsEaseInOut":
                            return e /= a / 2, 1 > e ? o / 2 * e * e * e + t : (e -= 2, o / 2 * (e * e * e + 2) + t);
                        case "easeOutSmooth":
                            return e /= a, e--, -o * (e * e * e * e - 1) + t;
                        case "easeOutStrong":
                            return o * (-Math.pow(2, -10 * e / a) + 1) + t;
                        case "easeOut":
                        case "mcsEaseOut":
                        default:
                            var i = (e /= a) * e,
                                r = i * e;
                            return t + o * (.499999999999997 * r * i + -2.5 * i * i + 5.5 * r + -6.5 * i + 4 * e)
                    }
                }
                e._mTween || (e._mTween = {
                    top: {},
                    left: {}
                });
                var f, h, r = r || {},
                    m = r.onStart || function() {},
                    p = r.onUpdate || function() {},
                    g = r.onComplete || function() {},
                    v = G(),
                    x = 0,
                    _ = e.offsetTop,
                    w = e.style,
                    S = e._mTween[t];
                "left" === t && (_ = e.offsetLeft);
                var b = o - _;
                S.stop = 0, "none" !== i && d(), c()
            },
            G = function() {
                return window.performance && window.performance.now ? window.performance.now() : window.performance && window.performance.webkitNow ? window.performance.webkitNow() : Date.now ? Date.now() : (new Date).getTime()
            },
            J = function() {
                var e = this;
                e._mTween || (e._mTween = {
                    top: {},
                    left: {}
                });
                for (var t = ["top", "left"], o = 0; o < t.length; o++) {
                    var a = t[o];
                    e._mTween[a].id && (window.requestAnimationFrame ? window.cancelAnimationFrame(e._mTween[a].id) : clearTimeout(e._mTween[a].id), e._mTween[a].id = null, e._mTween[a].stop = 1)
                }
            },
            K = function(e, t) {
                try {
                    delete e[t]
                } catch (o) {
                    e[t] = null
                }
            },
            Z = function(e) {
                return !(e.which && 1 !== e.which)
            },
            $ = function(e) {
                var t = e.originalEvent.pointerType;
                return !(t && "touch" !== t && 2 !== t)
            },
            ee = function(e) {
                return !isNaN(parseFloat(e)) && isFinite(e)
            },
            te = function(e) {
                var t = e.parents(".mCSB_container");
                return [e.offset().top - t.offset().top, e.offset().left - t.offset().left]
            };
        e.fn[o] = function(t) {
            return u[t] ? u[t].apply(this, Array.prototype.slice.call(arguments, 1)) : "object" != typeof t && t ? void e.error("Method " + t + " does not exist") : u.init.apply(this, arguments)
        }, e[o] = function(t) {
            return u[t] ? u[t].apply(this, Array.prototype.slice.call(arguments, 1)) : "object" != typeof t && t ? void e.error("Method " + t + " does not exist") : u.init.apply(this, arguments)
        }, e[o].defaults = i, window[o] = !0, e(window).load(function() {
            e(n)[o](), e.extend(e.expr[":"], {
                mcsInView: e.expr[":"].mcsInView || function(t) {
                    var o, a, n = e(t),
                        i = n.parents(".mCSB_container");
                    if (i.length) return o = i.parent(), a = [i[0].offsetTop, i[0].offsetLeft], a[0] + te(n)[0] >= 0 && a[0] + te(n)[0] < o.height() - n.outerHeight(!1) && a[1] + te(n)[1] >= 0 && a[1] + te(n)[1] < o.width() - n.outerWidth(!1)
                },
                mcsOverflow: e.expr[":"].mcsOverflow || function(t) {
                    var o = e(t).data(a);
                    if (o) return o.overflowed[0] || o.overflowed[1]
                }
            })
        })
    })
});

; // Reference/widget.js
var Roblox = Roblox || {};
Roblox.BootstrapWidgets = function() {
    function SetupTabs() {
        $('#horizontal-tabs a').on("click", function(e) {
            e.preventDefault();
            $(this).tab('show');
        });
        $('#horizontal-tabs a').on("touchstart", function(e) {
            e.preventDefault();
            $(this).trigger("click");
        });
        $('#vertical-tabs a').click(function(e) {
            e.preventDefault();
            $(this).tab('show');
        });
    }

    function SetupDropdown() {
        $('[data-toggle="dropdown-menu"] li').click(function(e) {
            var target = $(e.currentTarget);
            target.closest('.input-group-btn').find('[data-bind="label"]').text(target.text()).end().toggleClass("open");
            if (!target.hasClass("rbx-clickable-li")) {
                return false;
            }
        });
    }

    function ToggleAccordionIcon(target, expand) {
        var expandedIconClass = target.data("expanded-icon") || "icon-up-16x16";
        var collapsedIconClass = target.data("collapsed-icon") || "icon-down-16x16";
        var classToAdd = expand ? expandedIconClass : collapsedIconClass;
        var classToRemove = expand ? collapsedIconClass : expandedIconClass;
        target.prev('.panel-heading').find("." + classToRemove).removeClass(classToRemove).addClass(classToAdd);
    }

    function SetupAccordion() {
        $('[data-toggle="collapsible-element"]').on('show.bs.collapse', function(e) {
            ToggleAccordionIcon($(e.target), true);
        });
        $('[data-toggle="collapsible-element"]').on('hide.bs.collapse', function(e) {
            ToggleAccordionIcon($(e.target), false);
        });
    }

    function ShowAccordionMenu(selector) {
        $(selector).collapse("show");
    }

    function SetupTooltip() {
        if (!('ontouchstart' in window)) {
            $('[data-toggle="tooltip"]').tooltip({
                placement: 'bottom'
            });
        } else {
            $('[data-toggle-mobile="true"]').tooltip({
                placement: 'bottom',
                trigger: 'manual'
            }).unbind().on('touchstart', function() {
                $(this).tooltip('toggle');
            });
        }
    }

    function UpdateTooltip(element, newTitle) {
        $(element).attr('title', newTitle).tooltip('fixTitle');
    }

    function CloseTooltip() {
        $("body").on('click touchstart', function(e) {
            $('[data-toggle="tooltip"]').each(function() {
                if (!$(this).is(e.target) && $(this).has(e.target).length === 0) {
                    var canBeHidden = (e.type === "click") ? true : ($('.tooltip').has(e.target).length === 0);
                    if (canBeHidden) {
                        try {
                            $(this).tooltip('hide');
                        } catch (e) {
                            return false;
                        }
                    }
                }
            });
        });
    }

    function SetupPopover(placement, viewport, popoverSelector) {
        if (!placement) {
            placement = 'bottom';
        }
        if (!viewport) {
            viewport = {
                selector: 'body',
                padding: 4
            };
        }
        if (!popoverSelector) {
            popoverSelector = "[data-toggle='popover']";
        }
        $(popoverSelector).popover({
            trigger: 'manual',
            html: true,
            placement: placement,
            viewport: viewport,
            content: function() {
                var selector = $(this).attr('data-bind');
                return $('[data-toggle="' + selector + '"]').html();
            }
        }).unbind().on('click', function() {
            $(this).popover('toggle');
        });
    }

    function ClosePopover() {
        $("body").on('click touchstart', function(e) {
            $('[data-toggle="popover"]').each(function() {
                if (!$(this).is(e.target) && $(this).has(e.target).length === 0) {
                    var canBeHidden = $('.popover').has(e.target).length === 0;
                    if (e.type === "touchstart" && $('.popover').has(e.target).length > 0) {
                        canBeHidden = true;
                    } else if (e.type === "click") {
                        canBeHidden = true;
                    }
                    if (canBeHidden) {
                        $(this).popover('hide');
                    }
                }
            });
        });
    }

    function SetupScrollbar() {
        $('[data-toggle="scrollbar"]').mCustomScrollbar({
            autoHideScrollbar: false,
            autoExpandScrollbar: false,
            scrollInertia: 0,
            alwaysShowScrollbar: 1,
            mouseWheel: {
                preventDefault: true
            }
        });
    }

    function SetupPagination() {
        var pagination = $('[data-toggle="pagination"]');
        var pager = $('[data-toggle="pager"]');
        if (pagination.twbsPagination || pager.twbsPagination) {
            pagination.twbsPagination({
                totalPages: 35,
                visiblePages: 7,
                first: 1,
                last: 35,
                prev: '<span class="icon-left"></span>',
                next: '<span class="icon-right"></span>',
            });
            pager.twbsPagination({
                isPager: true,
                totalPages: 35,
                visiblePages: 7,
                first: '<span class="icon-first-page"></span>',
                last: '<span class="icon-last-page"></span>',
                prev: '<span class="icon-left"></span>',
                next: '<span class="icon-right"></span>',
            });
        }
    }

    function ToggleSystemMessage(alertElm, timeoutSlideDown, timeoutSlideUp, alertTextReplacement) {
        if (typeof alertElm !== "undefined") {
            var clone, detached;
            if (alertTextReplacement) {
                clone = alertElm.clone();
                clone.html(alertTextReplacement);
                alertElm.after(clone);
                detached = alertElm.detach();
            }
            timeoutSlideDown = typeof timeoutSlideDown === "undefined" ? 200 : timeoutSlideDown;
            timeoutSlideUp = typeof timeoutSlideUp === "undefined" ? 3000 : timeoutSlideUp;
            setTimeout(function() {
                if (clone) {
                    clone.addClass("on");
                } else {
                    alertElm.addClass("on");
                }
            }, timeoutSlideDown);
            setTimeout(function() {
                if (clone) {
                    clone.removeClass("on");
                } else {
                    alertElm.removeClass("on");
                }
                if (clone && detached) {
                    clone.after(detached);
                    clone.remove();
                }
            }, timeoutSlideUp);
        }
    }

    function SetupSystemFeedback() {
        $("#toggle-alert-loading").click(function() {
            ToggleSystemMessage($(".sg-alert-section .alert-loading"), 100, 1000);
        });
        $("#toggle-alert-success").click(function() {
            ToggleSystemMessage($(".sg-alert-section .alert-success"), 100, 1000);
        });
        $("#toggle-alert-warning").click(function() {
            var alertElm = $(".sg-alert-section .alert-warning");
            setTimeout(function() {
                alertElm.addClass("on");
            }, 100);
            var close = $(".alert-system-feedback #close");
            close.click(function() {
                alertElm.removeClass("on");
            });
        });
    }

    function Placeholder() {
        $('input[placeholder]').focus(function() {
            var input = $(this);
            if (input.val() == input.attr("placeholder")) {
                input.val('');
                input.removeClass("rbx-placeholder");
            }
        }).blur(function() {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr("placeholder")) {
                input.addClass("rbx-placeholder");
                input.val(input.attr("placeholder"));
            }
        });
    }
    var paraOverflowSelector = "para-overflow";
    var paraOverflowElement = $("." + paraOverflowSelector);

    function IsTruncated() {
        paraOverflowElement.each(function() {
            var elem = $(this);
            var clone = $(this).clone().hide().height("auto");
            clone.width(elem.width());
            $("body").append(clone);
            if (clone.height() <= elem.height()) {
                elem.removeClass(paraOverflowSelector);
                $(this).find(".toggle-para").hide();
            }
            clone.remove();
        });
    }

    function TruncateParagraph(lineHeight, numberOfLines) {
        var paraOverflowToggleSelector = "para-overflow-toggle";
        var paraOverflowToggleElement = $("." + paraOverflowToggleSelector);
        var paraHeightSelector = "para-height";
        var paraOverFlowLoading = "para-overflow-page-loading";
        lineHeight = !lineHeight ? 24 : lineHeight;
        numberOfLines = !numberOfLines ? 5 : numberOfLines;
        $(".toggle-para").show();
        paraOverflowToggleElement.each(function() {
            var elem = $(this);
            var clone = $(this).clone().hide().height("auto");
            clone.width(elem.width());
            $("body").append(clone);
            var maxHeight = lineHeight * numberOfLines;
            if (clone.height() <= maxHeight || clone.height() <= elem.height()) {
                elem.removeClass(paraOverflowToggleSelector).removeClass(paraHeightSelector);
                elem.find(".toggle-para").last().hide();
            }
            elem.removeClass(paraOverFlowLoading);
            clone.remove();
        });
    }

    function ToggleParagraph() {
        var paraOverflowToggleOffSelector = "para-overflow-toggle-off";
        var paraHeightSelector = "para-height";
        var bindToggleClick = function() {
            $(this).bind("click touchstart", function() {
                var paraOverflowToggleElement = $(".para-overflow-toggle");
                var moreTitle = $(this).data("show-label");
                var lessTitle = $(this).data("hide-label");
                if ($(this).text() === moreTitle) {
                    paraOverflowToggleElement.removeClass(paraHeightSelector).addClass(paraOverflowToggleOffSelector);
                    $(this).text(lessTitle);
                } else {
                    paraOverflowToggleElement.removeClass(paraOverflowToggleOffSelector).addClass(paraHeightSelector);
                    $(this).text(moreTitle);
                }
            });
        }
        $(".toggle-para").each(bindToggleClick);
    }

    function ToggleTranslation() {
        var bindToggleClick = function() {
            $(this).bind("click touchstart", function() {
                $("body").find(".swap-translated-content").each(function() {
                    var translatedText = $.trim($(this).data("translated-text"));
                    var sourceText = $.trim($(this).data("source-text"));
                    var displayText = $.trim($(this).text());
                    if (displayText === translatedText) {
                        $(this).text(sourceText);
                    } else {
                        $(this).text(translatedText);
                    }
                });
            });
        }
        $(".toggle-translation-button").each(bindToggleClick);
    }

    function TruncateContent() {
        var contentOverflowToggleSelector = "content-overflow-toggle";
        var contentOverflowToggleElement = $("." + contentOverflowToggleSelector);
        var contentHeightSelector = "content-height";
        var contentOverFlowLoading = "content-overflow-page-loading";
        $(".toggle-content").removeClass("hidden");
        contentOverflowToggleElement.each(function() {
            var elem = $(this);
            var clone = $(this).clone().hide().height("auto").width(elem.width());
            elem.parent().append(clone);
            clone.css("font-weight", elem.css("font-weight"));
            var containerId = elem.attr('id');
            var containerToggleElement = $(".toggle-content[data-container-id='" + containerId + "']");
            var showMoreGradientEnd = $(".show-more-end[data-container-id='" + containerId + "']");
            showMoreGradientEnd.removeClass("hide");
            if (clone.height() <= elem.height() || !(containerToggleElement.is(":visible"))) {
                elem.removeClass(contentOverflowToggleSelector).removeClass(contentHeightSelector);
                containerToggleElement.hide();
                showMoreGradientEnd.addClass("hide");
            }
            elem.removeClass(contentOverFlowLoading);
            clone.remove();
        });
    }

    function ToggleContent() {
        var contentOverflowToggleOffSelector = "content-overflow-toggle-off";
        var contentHeightSelector = "content-height";
        var bindToggleClick = function() {
            var moreTitle = $(this).data("show-label");
            var lessTitle = $(this).data("hide-label");
            $(this).unbind('click');
            $(this).bind("click", function() {
                var contentOverflowToggleElementId = $(this).data("container-id");
                var contentOverflowToggleElement = $("#" + contentOverflowToggleElementId);
                if ($(this).text() === moreTitle) {
                    contentOverflowToggleElement.removeClass(contentHeightSelector).addClass(contentOverflowToggleOffSelector);
                    $(this).text(lessTitle);
                    contentOverflowToggleElement.find(".show-more-end").addClass("hide");
                } else {
                    contentOverflowToggleElement.removeClass(contentOverflowToggleOffSelector).addClass(contentHeightSelector);
                    $(this).text(moreTitle);
                    contentOverflowToggleElement.find(".show-more-end").removeClass("hide");
                }
            });
        }
        $(".toggle-content").each(bindToggleClick);
    }

    function SetupCarousel(carouselId) {
        carouselId = !carouselId ? "#carousel" : carouselId;
        $(carouselId).carousel({
            interval: 6000,
            pause: "hover"
        });
    }

    function SetupToggleButton() {
        $(".btn-toggle").bind("click", function() {
            if ($(this).hasClass("disabled")) {
                return false;
            }
            $(this).toggleClass("on");
            $(this).trigger("toggleBtnClick", {
                id: $(this).attr("id"),
                toggleOn: $(this).hasClass("on")
            });
        });
    }

    function SetupVerticalMenu() {
        var currentX = 0;
        var dir = 0;
        var submenuContainerSelector = ".menu-secondary-container";
        var dropdown = $('.submenus');
        var listItems = dropdown.find('li');
        var subLists = dropdown.find('li ' + submenuContainerSelector);
        var hoverOverSublist = dropdown.find('li ' + submenuContainerSelector + '[hover=true]');
        subLists.on('mouseover touchstart', function() {
            $(this).attr('hover', 'true');
        });
        subLists.mouseout(function() {
            $(this).attr('hover', 'false');
        });
        listItems.on('mouseover touchstart', function() {
            var delay = $(this).data('delay');
            if (hoverOverSublist.length !== 0) {
                return;
            }
            $(this).attr('hover', 'true');
            if (delay !== 'never' && (dir === 1 || delay === 'always')) {
                window.setTimeout(function() {
                    if (hoverOverSublist.length !== 0) {
                        return;
                    }
                    var currentlyActiveMenu = dropdown.find('li[hover=true] ' + submenuContainerSelector);
                    subLists.hide();
                    if (currentlyActiveMenu.length !== 0) {
                        currentlyActiveMenu.show();
                    }
                }, 1000);
            } else {
                subLists.hide();
                var activeMenu = $(this).find(submenuContainerSelector);
                activeMenu.show();
            }
        });
        listItems.mouseout(function() {
            $(this).removeAttr('hover');
        });
        dropdown.mouseleave(function() {
            window.setTimeout(function() {
                subLists.hide();
            }, 100);
            currentX = 0;
            dir = 0;
        });
        dropdown.mousemove(function(event) {
            var oldX = currentX;
            currentX = event.pageX;
            if (oldX === currentX || oldX === 0) {
                dir = 0;
            }
            if (oldX < currentX) {
                dir = 1;
            } else {
                dir = -1;
            }
        });
        $("body").on('touchstart', function(e) {
            if (!dropdown.is(e.target) && dropdown.has(e.target).length === 0) {
                subLists.hide();
            }
        });
    }
    return {
        SetupTabs: SetupTabs,
        SetupDropdown: SetupDropdown,
        SetupAccordion: SetupAccordion,
        ShowAccordionMenu: ShowAccordionMenu,
        SetupTooltip: SetupTooltip,
        UpdateTooltip: UpdateTooltip,
        CloseTooltip: CloseTooltip,
        SetupPopover: SetupPopover,
        ClosePopover: ClosePopover,
        SetupScrollbar: SetupScrollbar,
        SetupPagination: SetupPagination,
        Placeholder: Placeholder,
        IsTruncated: IsTruncated,
        TruncateParagraph: TruncateParagraph,
        ToggleParagraph: ToggleParagraph,
        ToggleTranslation: ToggleTranslation,
        SetupCarousel: SetupCarousel,
        SetupToggleButton: SetupToggleButton,
        SetupSystemFeedback: SetupSystemFeedback,
        ToggleSystemMessage: ToggleSystemMessage,
        SetupVerticalMenu: SetupVerticalMenu,
        TruncateContent: TruncateContent,
        ToggleContent: ToggleContent
    }
}();
$(function() {
    Roblox.BootstrapWidgets.SetupTabs();
    Roblox.BootstrapWidgets.SetupDropdown();
    Roblox.BootstrapWidgets.SetupAccordion();
    Roblox.BootstrapWidgets.SetupTooltip();
    Roblox.BootstrapWidgets.CloseTooltip();
    Roblox.BootstrapWidgets.SetupPopover();
    Roblox.BootstrapWidgets.ClosePopover();
    Roblox.BootstrapWidgets.SetupScrollbar();
    Roblox.BootstrapWidgets.SetupPagination();
    if (typeof Modernizr != "undefined" && !Modernizr.input.placeholder) {
        Roblox.BootstrapWidgets.Placeholder();
    }
    Roblox.BootstrapWidgets.IsTruncated();
    Roblox.BootstrapWidgets.TruncateParagraph();
    Roblox.BootstrapWidgets.ToggleParagraph();
    Roblox.BootstrapWidgets.SetupCarousel();
    Roblox.BootstrapWidgets.SetupToggleButton();
    Roblox.BootstrapWidgets.SetupSystemFeedback();
    Roblox.BootstrapWidgets.ToggleSystemMessage();
    Roblox.BootstrapWidgets.SetupVerticalMenu();
    Roblox.BootstrapWidgets.TruncateContent();
    Roblox.BootstrapWidgets.ToggleContent();
    Roblox.BootstrapWidgets.ToggleTranslation();
});

; // CookieUpgrader.js
if (typeof Roblox == "undefined") {
    Roblox = {};
}
if (typeof Roblox.CookieUpgrader == "undefined") {
    Roblox.CookieUpgrader = {}
};
Roblox.CookieUpgrader.domain = "";
Roblox.CookieUpgrader.oneMonthInMs = 1000 * 60 * 60 * 24 * 30;
Roblox.CookieUpgrader.upgrade = function(name, options) {
    function getCookie(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie !== "") {
            var cookies = document.cookie.split(";");
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                if (cookie.substring(0, name.length + 1) === (name + "=")) {
                    cookieValue = cookie.substring(name.length + 1);
                    break;
                }
            }
        }
        return cookieValue;
    }
    if (Roblox.CookieUpgrader.domain === "") {
        return;
    }
    var originalCookieValue = getCookie(name);
    if (originalCookieValue == null) {
        return;
    }
    try {
        var originalCookieLength = document.cookie.length;
        document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
        document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/; domain=" + window.location.host;
        if (document.cookie.length === originalCookieLength) {
            return;
        }
        var newCookieName = name;
        if (typeof options.newCookieName != "undefined") {
            newCookieName = options.newCookieName;
        }
        var cookieValue = getCookie(name);
        if (cookieValue != null) {
            if (typeof GoogleAnalyticsEvents != "undefined") {
                GoogleAnalyticsEvents.FireEvent(["CookieUpgrader", "DeletedRedundantCookie", name]);
            }
            var deletedCookieData = {
                cookieName: name,
                cookieValue: cookieValue
            };
            if (Roblox.EventStream) {
                Roblox.EventStream.SendEventWithTarget("CookieUpgrader", "DeletedRedundantCookie", deletedCookieData, Roblox.EventStream.TargetTypes.DIAGNOSTIC);
            }
            return;
        }
        var cookie = newCookieName + "=" + originalCookieValue + "; ";
        cookie += "expires=" + options.expires(originalCookieValue).toUTCString() + "; ";
        cookie += "path=/; domain=" + Roblox.CookieUpgrader.domain;
        document.cookie = cookie;
        if (typeof GoogleAnalyticsEvents != "undefined") {
            GoogleAnalyticsEvents.FireEvent(["CookieUpgrader", "ConvertedCookie", name]);
        }
        var convertedCookieData = {
            cookieName: name,
            cookieValue: originalCookieValue,
            newCookieName: newCookieName
        };
        if (Roblox.EventStream) {
            Roblox.EventStream.SendEventWithTarget("CookieUpgrader", "ConvertedCookie", convertedCookieData, Roblox.EventStream.TargetTypes.DIAGNOSTIC);
        }
    } catch (exp) {
        if (typeof GoogleAnalyticsEvents != "undefined") {
            GoogleAnalyticsEvents.FireEvent(["CookieUpgrader", "ExceptionDuringConvertOf" + name, exp.message]);
        }
    }
};
Roblox.CookieUpgrader.getExpirationFromCookieValue = function getExpirationFromCookieValue(propertyName, originalCookieValue) {
    var acquisitionTimeRegex = new RegExp(propertyName + "=(\\d+)\/(\\d+)\/(\\d+)");
    var originalCookieTimeMatches = originalCookieValue.match(acquisitionTimeRegex);
    var startTime = (new Date()).getTime();
    if (originalCookieTimeMatches != null && originalCookieTimeMatches.length != 0) {
        var originalCookieTime = new Date(originalCookieTimeMatches[3], originalCookieTimeMatches[1] - 1, originalCookieTimeMatches[2]);
        if (!isNaN(originalCookieTime.getTime())) {
            startTime = originalCookieTime.getTime();
        }
    }
    return new Date(startTime + Roblox.CookieUpgrader.oneMonthInMs);
};
Roblox.CookieUpgrader.thirtyDaysFromNow = function() {
    return new Date((new Date()).getTime() + Roblox.CookieUpgrader.oneMonthInMs);
};
Roblox.CookieUpgrader.thirtyYearsFromNow = function() {
    return new Date((new Date()).getTime() + 1000 * 60 * 60 * 24 * 365 * 30);
};
Roblox.CookieUpgrader.fourHoursFromNow = function() {
    return new Date((new Date()).getTime() + 1000 * 60 * 60 * 4);
};

; // leancore/RobloxBaseInit.js
if (("modal" in $.fn) && ("noConflict" in $.fn.modal)) {
    $.fn.bootstrapModal = $.fn.modal.noConflict();
}

; // common/robloxError.js
'use strict';
var RobloxError = (function() {
    var RobloxError = function(message, errorType) {
        var errorClass = errorType && errorType.name;
        switch (errorClass) {
            case 'TypeError':
                this.error = new TypeError(message);
                break;
            case 'EvalError':
                this.error = new EvalError(message);
                break;
            case 'RangeError':
                this.error = new RangeError(message);
                break;
            case 'ReferenceError':
                this.error = new ReferenceError(message);
                break;
            default:
                this.error = new Error(message);
                break;
        }
    }
    RobloxError.prototype.throw = function(fallbackAction) {
        if (Roblox && Roblox.jsConsoleEnabled) {
            throw this.error;
        }
        if (fallbackAction && typeof fallbackAction === "function") {
            fallbackAction();
        }
    }
    return RobloxError;
})();

; // ~/Generated/js/Roblox_TranslationResources_CommonUI_ControlsResources_en_us_standard.js
var Roblox = Roblox || {};
Roblox.Lang = Roblox.Lang || {};
Roblox.Lang['CommonUI.Controls'] = {
    "Action.Accept": "Accept",
    "Action.AcceptAll": "Accept All",
    "Action.Agree": "Agree",
    "Action.Allow": "Allow",
    "Action.Approve": "Approve",
    "Action.Back": "Back",
    "Action.BuyRobux": "Buy Robux",
    "Action.Cancel": "Cancel",
    "Action.Close": "Close",
    "Action.Collapse": "Collapse",
    "Action.Confirm": "Confirm",
    "Action.Continue": "Continue",
    "Action.Decline": "Decline",
    "Action.DeclineAll": "Decline All",
    "Action.Delete": "Delete",
    "Action.Deny": "Deny",
    "Action.Disable": "Disable",
    "Action.Discard": "Discard",
    "Action.Distribute": "Distribute",
    "Action.Done": "Done",
    "Action.Enable": "Enable",
    "Action.GotIt": "Got It",
    "Action.IgnoreAll": "Ignore All",
    "Action.Next": "Next",
    "Action.No": "No",
    "Action.OK": "OK",
    "Action.Open": "Open",
    "Action.Refresh": "Refresh",
    "Action.Remove": "Remove",
    "Action.Save": "Save",
    "Action.Search": "Search",
    "Action.SeeAll": "See All",
    "Action.SeeLess": "See Less",
    "Action.SeeMore": "See More",
    "Action.Select": "Select",
    "Action.Show": "Show",
    "Action.Stop": "Stop",
    "Action.Submit": "Submit",
    "Action.SwitchAccount": "Switch Account",
    "Action.Yes": "Yes",
    "Birthdaypicker.Label.Date": "Date",
    "Description.UnsavedChange": "You have unsaved changes. Do you want to proceed?",
    "Label.April": "April",
    "Label.AprilAbbreviated": "Apr",
    "Label.August": "August",
    "Label.AugustAbbreviated": "Aug",
    "Label.CurrentPage": "Page {currentPage}",
    "Label.Day": "Day",
    "Label.December": "December",
    "Label.DecemberAbbreviated": "Dec",
    "Label.February": "February",
    "Label.FebruaryAbbreviated": "Feb",
    "Label.January": "January",
    "Label.JanuaryAbbreviated": "Jan",
    "Label.July": "July",
    "Label.June": "June",
    "Label.March": "March",
    "Label.MarchAbbreviated": "Mar",
    "Label.May": "May",
    "Label.Month": "Month",
    "Label.Name": "Name",
    "Label.Next": "Next",
    "Label.November": "November",
    "Label.NovemberAbbreviated": "Nov",
    "Label.October": "October",
    "Label.OctoberAbbreviated": "Oct",
    "Label.Previous": "Previous",
    "Label.September": "September",
    "Label.SeptemberAbbreviated": "Sept",
    "Label.Summary": "Summary",
    "Label.UnsavedChanges": "Unsaved Changes",
    "Label.Week": "Week",
    "Label.Year": "Year"
};
Roblox.Lang['ControlsResources'] = Roblox.Lang['CommonUI.Controls'];

; // Thumbnails/thumbnailMetrics.js
var Roblox = Roblox || {};
Roblox.ThumbnailMetrics = (function() {
    var metricsBaseUrl = Roblox.EnvironmentUrls && Roblox.EnvironmentUrls.metricsApi || 'https://metrics.roblox.com',
        metricsLoadTimeUrl = metricsBaseUrl + '/v1/thumbnails/load',
        metricsMetadataUrl = metricsBaseUrl + '/v1/thumbnails/metadata',
        loadStates = {
            complete: 'complete',
            timeout: 'timeout'
        },
        initDone = false,
        queue = [],
        logProbability = 0.0;

    function setLogProbability(num) {
        logProbability = parseFloat(num);
    }

    function shouldLog() {
        return Math.random() <= logProbability;
    }

    function processQueue() {
        queue.forEach(function(funcToCall) {
            funcToCall();
        });
    }

    function init() {
        $.ajax({
            type: "GET",
            url: metricsMetadataUrl,
            crossDomain: true,
            xhrFields: {
                withCredentials: true
            },
            success: function(data) {
                if (data) {
                    logProbability = data.logRatio;
                }
                initDone = true;
                processQueue();
            },
            error: function() {
                initDone = true;
            }
        });
    }

    function logFinalThumbnailTime(duration, thumbnailType) {
        if (thumbnailType === undefined) {
            thumbnailType = "";
        }
        if (!initDone) {
            queue.push(function() {
                logFinalThumbnailTime(duration, thumbnailType);
            });
            return false;
        }
        if (!shouldLog()) {
            return false;
        }
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: metricsLoadTimeUrl,
            crossDomain: true,
            xhrFields: {
                withCredentials: true
            },
            data: {
                duration: duration,
                loadState: loadStates.complete,
                thumbnailType: thumbnailType
            }
        });
    }

    function logThumbnailTimeout(thumbnailType) {
        if (thumbnailType === undefined) {
            thumbnailType = "";
        }
        if (!initDone) {
            queue.push(logThumbnailTimeout(thumbnailType));
            return false;
        }
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: metricsLoadTimeUrl,
            crossDomain: true,
            xhrFields: {
                withCredentials: true
            },
            data: {
                loadState: loadStates.timeout,
                thumbnailType: thumbnailType
            }
        });
    }
    init();
    return {
        logFinalThumbnailTime: logFinalThumbnailTime,
        setLogProbability: setLogProbability,
        logThumbnailTimeout: logThumbnailTimeout,
        init: init
    };
})();

; // DisplayNames/DisplayNames.js
Roblox = Roblox || {};
Roblox.DisplayNames = function() {
    "use strict";

    function isEnabled() {
        var config = $("#roblox-display-names");
        if (config.length) {
            return config.data("enabled");
        }
        return false;
    }
    return {
        Enabled: isEnabled
    };
}();

; // jquery.tipsy.js
(function($) {
    function maybeCall(thing, ctx) {
        return (typeof thing == 'function') ? (thing.call(ctx)) : thing;
    };

    function isElementInDOM(ele) {
        while (ele = ele.parentNode) {
            if (ele == document) return true;
        }
        return false;
    };

    function Tipsy(element, options) {
        this.$element = $(element);
        this.options = options;
        this.enabled = true;
        this.fixTitle();
    };
    Tipsy.prototype = {
        show: function() {
            var title = this.getTitle();
            if (title && this.enabled) {
                var $tip = this.tip();
                $tip.find('.tipsy-inner')[this.options.html ? 'html' : 'text'](title);
                $tip[0].className = 'tipsy';
                $tip.remove().css({
                    top: 0,
                    left: 0,
                    visibility: 'hidden',
                    display: 'block'
                }).prependTo(document.body);
                var pos = $.extend({}, this.$element.offset(), {
                    width: this.$element[0].offsetWidth,
                    height: this.$element[0].offsetHeight
                });
                var actualWidth = $tip[0].offsetWidth,
                    actualHeight = $tip[0].offsetHeight,
                    gravity = maybeCall(this.options.gravity, this.$element[0]);
                var tp;
                switch (gravity.charAt(0)) {
                    case 'n':
                        tp = {
                            top: pos.top + pos.height + this.options.offset,
                            left: pos.left + pos.width / 2 - actualWidth / 2
                        };
                        break;
                    case 's':
                        tp = {
                            top: pos.top - actualHeight - this.options.offset,
                            left: pos.left + pos.width / 2 - actualWidth / 2
                        };
                        break;
                    case 'e':
                        tp = {
                            top: pos.top + pos.height / 2 - actualHeight / 2,
                            left: pos.left - actualWidth - this.options.offset
                        };
                        break;
                    case 'w':
                        tp = {
                            top: pos.top + pos.height / 2 - actualHeight / 2,
                            left: pos.left + pos.width + this.options.offset
                        };
                        break;
                }
                if (gravity.length == 2) {
                    if (gravity.charAt(1) == 'w') {
                        tp.left = pos.left + pos.width / 2 - 15;
                    } else {
                        tp.left = pos.left + pos.width / 2 - actualWidth + 15;
                    }
                }
                $tip.css(tp).addClass('tipsy-' + gravity);
                $tip.find('.tipsy-arrow')[0].className = 'tipsy-arrow tipsy-arrow-' + gravity.charAt(0);
                if (this.options.className) {
                    $tip.addClass(maybeCall(this.options.className, this.$element[0]));
                }
                if (this.options.fade) {
                    $tip.stop().css({
                        opacity: 0,
                        display: 'block',
                        visibility: 'visible'
                    }).animate({
                        opacity: this.options.opacity
                    });
                } else {
                    $tip.css({
                        visibility: 'visible',
                        opacity: this.options.opacity
                    });
                }
            }
        },
        hide: function() {
            if (this.options.fade) {
                this.tip().stop().fadeOut(function() {
                    $(this).remove();
                });
            } else {
                this.tip().remove();
            }
        },
        fixTitle: function() {
            var $e = this.$element;
            if ($e.attr('title') || typeof($e.attr('original-title')) != 'string') {
                $e.attr('original-title', $e.attr('title') || '').removeAttr('title');
            }
        },
        getTitle: function() {
            var title, $e = this.$element,
                o = this.options;
            this.fixTitle();
            var title, o = this.options;
            if (typeof o.title == 'string') {
                title = $e.attr(o.title == 'title' ? 'original-title' : o.title);
            } else if (typeof o.title == 'function') {
                title = o.title.call($e[0]);
            }
            title = ('' + title).replace(/(^\s*|\s*$)/, "");
            return title || o.fallback;
        },
        tip: function() {
            if (!this.$tip) {
                this.$tip = $('<div class="tipsy"></div>').html('<div class="tipsy-arrow"></div><div class="tipsy-inner"></div>');
                this.$tip.data('tipsy-pointee', this.$element[0]);
            }
            return this.$tip;
        },
        validate: function() {
            if (!this.$element[0].parentNode) {
                this.hide();
                this.$element = null;
                this.options = null;
            }
        },
        enable: function() {
            this.enabled = true;
        },
        disable: function() {
            this.enabled = false;
        },
        toggleEnabled: function() {
            this.enabled = !this.enabled;
        }
    };
    $.fn.tipsy = function(options) {
        if (options === true) {
            return this.data('tipsy');
        } else if (typeof options == 'string') {
            var tipsy = this.data('tipsy');
            if (tipsy) tipsy[options]();
            return this;
        }
        options = $.extend({}, $.fn.tipsy.defaults, options);

        function get(ele) {
            var tipsy = $.data(ele, 'tipsy');
            if (!tipsy) {
                tipsy = new Tipsy(ele, $.fn.tipsy.elementOptions(ele, options));
                $.data(ele, 'tipsy', tipsy);
            }
            return tipsy;
        }

        function enter() {
            var tipsy = get(this);
            tipsy.hoverState = 'in';
            if (options.delayIn == 0) {
                tipsy.show();
            } else {
                tipsy.fixTitle();
                setTimeout(function() {
                    if (tipsy.hoverState == 'in') tipsy.show();
                }, options.delayIn);
            }
        };

        function leave() {
            var tipsy = get(this);
            tipsy.hoverState = 'out';
            if (options.delayOut == 0) {
                tipsy.hide();
            } else {
                setTimeout(function() {
                    if (tipsy.hoverState == 'out') tipsy.hide();
                }, options.delayOut);
            }
        };
        if (!options.live) this.each(function() {
            get(this);
        });
        if (options.trigger != 'manual') {
            var binder = options.live ? 'live' : 'bind',
                eventIn = options.trigger == 'hover' ? 'mouseenter' : 'focus',
                eventOut = options.trigger == 'hover' ? 'mouseleave' : 'blur';
            this[binder](eventIn, enter)[binder](eventOut, leave);
        }
        return this;
    };
    $.fn.tipsy.defaults = {
        className: null,
        delayIn: 0,
        delayOut: 0,
        fade: false,
        fallback: '',
        gravity: 'n',
        html: false,
        live: false,
        offset: 0,
        opacity: 0.8,
        title: 'title',
        trigger: 'hover'
    };
    $.fn.tipsy.revalidate = function() {
        $('.tipsy').each(function() {
            var pointee = $.data(this, 'tipsy-pointee');
            if (!pointee || !isElementInDOM(pointee)) {
                $(this).remove();
            }
        });
    };
    $.fn.tipsy.elementOptions = function(ele, options) {
        return $.metadata ? $.extend({}, options, $(ele).metadata()) : options;
    };
    $.fn.tipsy.autoNS = function() {
        return $(this).offset().top > ($(document).scrollTop() + $(window).height() / 2) ? 's' : 'n';
    };
    $.fn.tipsy.autoWE = function() {
        return $(this).offset().left > ($(document).scrollLeft() + $(window).width() / 2) ? 'e' : 'w';
    };
    $.fn.tipsy.autoBounds = function(margin, prefer) {
        return function() {
            var dir = {
                    ns: prefer[0],
                    ew: (prefer.length > 1 ? prefer[1] : false)
                },
                boundTop = $(document).scrollTop() + margin,
                boundLeft = $(document).scrollLeft() + margin,
                $this = $(this);
            if ($this.offset().top < boundTop) dir.ns = 'n';
            if ($this.offset().left < boundLeft) dir.ew = 'w';
            if ($(window).width() + $(document).scrollLeft() - $this.offset().left < margin) dir.ew = 'e';
            if ($(window).height() + $(document).scrollTop() - $this.offset().top < margin) dir.ns = 's';
            return dir.ns + (dir.ew ? dir.ew : '');
        }
    };
})(jQuery);

; // extensions/string.js
$.extend(String.prototype, (function() {
    function escapeHTML() {
        var retval = this.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#39;');
        return retval;
    }
    return {
        escapeHTML: escapeHTML
    };
})());

; // StringTruncator.js
var isInitialized = false;
var fitStringSpan = null;

function InitStringTruncator() {
    if (isInitialized)
        return;
    fitStringSpan = document.createElement("span");
    fitStringSpan.style.display = 'inline-block';
    fitStringSpan.style.visibility = 'hidden';
    fitStringSpan.style.height = '0px';
    fitStringSpan.style.padding = '0px';
    document.body.appendChild(fitStringSpan);
    isInitialized = true;
}

function fitStringToWidth(str, width, className) {
    if (!isInitialized)
        InitStringTruncator();

    function _escTag(s) {
        return s.replace("<", "&lt;").replace(">", "&gt;");
    }
    if (className)
        fitStringSpan.className = className;
    var result = _escTag(str);
    fitStringSpan.innerHTML = result;
    if (fitStringSpan.offsetWidth > width) {
        var posStart = 0,
            posMid, posEnd = str.length,
            posLength;
        while (posLength = (posEnd - posStart) >> 1) {
            posMid = posStart + posLength;
            fitStringSpan.innerHTML = _escTag(str.substring(0, posMid)) + '&hellip;';
            if (fitStringSpan.offsetWidth > width) posEnd = posMid;
            else posStart = posMid;
        }
        result = str.substring(0, posStart) + '&hellip;';
    }
    return result;
}

function fitStringToWidthSafe(str, width, className) {
    var safeName = fitStringToWidth(str, width, className);
    if (safeName.indexOf("&hellip;") != -1) {
        var posEnd = safeName.lastIndexOf(" ");
        if (posEnd != -1 && posEnd + 10 <= safeName.length) {
            safeName = safeName.substring(0, posEnd + 2) + "&hellip;";
        }
    }
    return safeName;
}

function fitStringToWidthSafeText(str, width, className) {
    var safeName = fitStringToWidthSafe(str, width, className).replace("&hellip;", "...");
    return safeName;
}

; // MasterPageUI.js
$(function() {
    try {
        $('.tooltip').tipsy();
        $('.tooltip-top').tipsy({
            gravity: 's'
        });
        $('.tooltip-right').tipsy({
            gravity: 'w'
        });
        $('.tooltip-left').tipsy({
            gravity: 'e'
        });
        $('.tooltip-bottom').tipsy({
            gravity: 'n'
        });
    } catch (err) {}
    $('a.btn-disabled-primary[disabled]').prop('disabled', true);
});
if (typeof Roblox === "undefined") {
    Roblox = {};
}
Roblox.FixedUI = function() {
    var unfixHeaderThreshold = 700;
    var ua = navigator.userAgent.toLowerCase();
    var isMobile = /mobile/i.test(ua) || /ipad/i.test(ua) || /iphone/i.test(ua) || /android/i.test(ua) || /playbook/i.test(ua) || /blackberry/i.test(ua);

    function getWindowWidth() {
        var winW = 1024;
        if (document.body && document.body.offsetWidth) winW = document.body.offsetWidth;
        if (window.innerWidth && window.innerHeight) winW = window.innerWidth;
        return winW;
    }

    function isHeaderFixed() {
        return getWindowWidth() > unfixHeaderThreshold;
    }
    var my = {
        isMobile: isMobile,
        isHeaderFixed: isHeaderFixed,
        getWindowWidth: getWindowWidth
    };
    return my;
}();

; // jquery.simplemodal-1.3.5.js
;
(function(factory) {
        if (typeof define === 'function' && define.amd) {
            define(['jquery'], factory);
        } else {
            factory(jQuery);
        }
    }
    (function($) {
        var d = [],
            doc = $(document),
            ua = navigator.userAgent.toLowerCase(),
            wndw = $(window),
            w = [];
        var browser = {
            ieQuirks: null,
            msie: /msie/.test(ua) && !/opera/.test(ua),
            opera: /opera/.test(ua)
        };
        browser.ie6 = browser.msie && /msie 6./.test(ua) && typeof window['XMLHttpRequest'] !== 'object';
        browser.ie7 = browser.msie && /msie 7.0/.test(ua);
        browser.boxModel = (document.compatMode === "CSS1Compat");
        $.modal = function(data, options) {
            return $.modal.impl.init(data, options);
        };
        $.modal.close = function() {
            $.modal.impl.close();
        };
        $.modal.focus = function(pos) {
            $.modal.impl.focus(pos);
        };
        $.modal.setContainerDimensions = function() {
            $.modal.impl.setContainerDimensions();
        };
        $.modal.setPosition = function() {
            $.modal.impl.setPosition();
        };
        $.modal.update = function(height, width) {
            $.modal.impl.update(height, width);
        };
        $.fn.modal = function(options) {
            return $.modal.impl.init(this, options);
        };
        $.modal.defaults = {
            appendTo: 'body',
            focus: true,
            opacity: 50,
            overlayId: 'simplemodal-overlay',
            overlayCss: {},
            containerId: 'simplemodal-container',
            containerCss: {},
            dataId: 'simplemodal-data',
            dataCss: {},
            minHeight: null,
            minWidth: null,
            maxHeight: null,
            maxWidth: null,
            autoResize: false,
            autoPosition: true,
            zIndex: 1000,
            close: true,
            closeHTML: '<a class="modalCloseImg" title="Close"></a>',
            closeClass: 'simplemodal-close',
            escClose: true,
            overlayClose: false,
            fixed: true,
            position: null,
            persist: false,
            modal: true,
            onOpen: null,
            onShow: null,
            onClose: null
        };
        $.modal.impl = {
            d: {},
            init: function(data, options) {
                var s = this;
                if (s.d.data) {
                    return false;
                }
                browser.ieQuirks = browser.msie && !($.support.boxModel === undefined) && !$.support.boxModel;
                s.o = $.extend({}, $.modal.defaults, options);
                s.zIndex = s.o.zIndex;
                s.occb = false;
                if (typeof data === 'object') {
                    data = data instanceof $ ? data : $(data);
                    s.d.placeholder = false;
                    if (data.parent().parent().size() > 0) {
                        data.before($('<span></span>').attr('id', 'simplemodal-placeholder').css({
                            display: 'none'
                        }));
                        s.d.placeholder = true;
                        s.display = data.css('display');
                        if (!s.o.persist) {
                            s.d.orig = data.clone(true);
                        }
                    }
                } else if (typeof data === 'string' || typeof data === 'number') {
                    data = $('<div></div>').html(data);
                } else {
                    alert('SimpleModal Error: Unsupported data type: ' + typeof data);
                    return s;
                }
                s.create(data);
                data = null;
                s.open();
                if ($.isFunction(s.o.onShow)) {
                    s.o.onShow.apply(s, [s.d]);
                }
                return s;
            },
            create: function(data) {
                var s = this;
                s.getDimensions();
                if (s.o.modal && browser.ie6) {
                    s.d.iframe = $('<iframe src="javascript:false;"></iframe>').css($.extend(s.o.iframeCss, {
                        display: 'none',
                        opacity: 0,
                        position: 'fixed',
                        height: w[0],
                        width: w[1],
                        zIndex: s.o.zIndex,
                        top: 0,
                        left: 0
                    })).appendTo(s.o.appendTo);
                }
                s.d.overlay = $('<div></div>').attr('id', s.o.overlayId).addClass('simplemodal-overlay').css($.extend(s.o.overlayCss, {
                    display: 'none',
                    opacity: s.o.opacity / 100,
                    height: s.o.modal ? d[0] : 0,
                    width: s.o.modal ? d[1] : 0,
                    position: 'fixed',
                    left: 0,
                    top: 0,
                    zIndex: s.o.zIndex + 1
                })).appendTo(s.o.appendTo);
                s.d.container = $('<div></div>').attr('id', s.o.containerId).addClass('simplemodal-container').css($.extend({
                    position: s.o.fixed ? 'fixed' : 'absolute'
                }, s.o.containerCss, {
                    display: 'none',
                    zIndex: s.o.zIndex + 2
                })).append(s.o.close && s.o.closeHTML ? $(s.o.closeHTML).addClass(s.o.closeClass) : '').appendTo(s.o.appendTo);
                s.d.wrap = $('<div></div>').attr('tabIndex', -1).addClass('simplemodal-wrap').css({
                    height: '100%',
                    outline: 0,
                    width: '100%'
                }).appendTo(s.d.container);
                s.d.data = data.attr('id', data.attr('id') || s.o.dataId).addClass('simplemodal-data').css($.extend(s.o.dataCss, {
                    display: 'none'
                })).appendTo('body');
                data = null;
                s.setContainerDimensions();
                s.d.data.appendTo(s.d.wrap);
                if (browser.ie6 || browser.ieQuirks) {
                    s.fixIE();
                }
            },
            bindEvents: function() {
                var s = this;
                $('.' + s.o.closeClass).bind('click.simplemodal', function(e) {
                    e.preventDefault();
                    s.close();
                });
                if (s.o.modal && s.o.close && s.o.overlayClose) {
                    s.d.overlay.bind('click.simplemodal', function(e) {
                        e.preventDefault();
                        s.close();
                    });
                }
                doc.bind('keydown.simplemodal', function(e) {
                    if (s.o.modal && e.keyCode === 9) {
                        s.watchTab(e);
                    } else if ((s.o.close && s.o.escClose) && e.keyCode === 27) {
                        e.preventDefault();
                        s.close();
                    }
                });
                wndw.bind('resize.simplemodal orientationchange.simplemodal', function() {
                    s.getDimensions();
                    s.o.autoResize ? s.setContainerDimensions() : s.o.autoPosition && s.setPosition();
                    if (browser.ie6 || browser.ieQuirks) {
                        s.fixIE();
                    } else if (s.o.modal) {
                        s.d.iframe && s.d.iframe.css({
                            height: w[0],
                            width: w[1]
                        });
                        s.d.overlay.css({
                            height: d[0],
                            width: d[1]
                        });
                    }
                });
            },
            unbindEvents: function() {
                $('.' + this.o.closeClass).unbind('click.simplemodal');
                doc.unbind('keydown.simplemodal');
                wndw.unbind('.simplemodal');
                this.d.overlay.unbind('click.simplemodal');
            },
            fixIE: function() {
                var s = this,
                    p = s.o.position;
                $.each([s.d.iframe || null, !s.o.modal ? null : s.d.overlay, s.d.container.css('position') === 'fixed' ? s.d.container : null], function(i, el) {
                    if (el) {
                        var bch = 'document.body.clientHeight',
                            bcw = 'document.body.clientWidth',
                            bsh = 'document.body.scrollHeight',
                            bsl = 'document.body.scrollLeft',
                            bst = 'document.body.scrollTop',
                            bsw = 'document.body.scrollWidth',
                            ch = 'document.documentElement.clientHeight',
                            cw = 'document.documentElement.clientWidth',
                            sl = 'document.documentElement.scrollLeft',
                            st = 'document.documentElement.scrollTop',
                            s = el[0].style;
                        s.position = 'absolute';
                        if (i < 2) {
                            s.removeExpression('height');
                            s.removeExpression('width');
                            s.setExpression('height', '' + bsh + ' > ' + bch + ' ? ' + bsh + ' : ' + bch + ' + "px"');
                            s.setExpression('width', '' + bsw + ' > ' + bcw + ' ? ' + bsw + ' : ' + bcw + ' + "px"');
                        } else {
                            var te, le;
                            if (p && p.constructor === Array) {
                                var top = p[0] ? typeof p[0] === 'number' ? p[0].toString() : p[0].replace(/px/, '') : el.css('top').replace(/px/, '');
                                te = top.indexOf('%') === -1 ? top + ' + (t = ' + st + ' ? ' + st + ' : ' + bst + ') + "px"' : parseInt(top.replace(/%/, '')) + ' * ((' + ch + ' || ' + bch + ') / 100) + (t = ' + st + ' ? ' + st + ' : ' + bst + ') + "px"';
                                if (p[1]) {
                                    var left = typeof p[1] === 'number' ? p[1].toString() : p[1].replace(/px/, '');
                                    le = left.indexOf('%') === -1 ? left + ' + (t = ' + sl + ' ? ' + sl + ' : ' + bsl + ') + "px"' : parseInt(left.replace(/%/, '')) + ' * ((' + cw + ' || ' + bcw + ') / 100) + (t = ' + sl + ' ? ' + sl + ' : ' + bsl + ') + "px"';
                                }
                            } else {
                                te = '(' + ch + ' || ' + bch + ') / 2 - (this.offsetHeight / 2) + (t = ' + st + ' ? ' + st + ' : ' + bst + ') + "px"';
                                le = '(' + cw + ' || ' + bcw + ') / 2 - (this.offsetWidth / 2) + (t = ' + sl + ' ? ' + sl + ' : ' + bsl + ') + "px"';
                            }
                            s.removeExpression('top');
                            s.removeExpression('left');
                            s.setExpression('top', te);
                            s.setExpression('left', le);
                        }
                    }
                });
            },
            focus: function(pos) {
                var s = this,
                    p = pos && $.inArray(pos, ['first', 'last']) !== -1 ? pos : 'first';
                var input = $(':input:enabled:visible:' + p, s.d.wrap);
                setTimeout(function() {
                    input.length > 0 ? input.focus() : s.d.wrap.focus();
                }, 10);
            },
            getDimensions: function() {
                var s = this,
                    h = typeof window.innerHeight === 'undefined' ? wndw.height() : window.innerHeight;
                d = [doc.height(), doc.width()];
                w = [h, wndw.width()];
            },
            getVal: function(v, d) {
                return v ? (typeof v === 'number' ? v : v === 'auto' ? 0 : v.indexOf('%') > 0 ? ((parseInt(v.replace(/%/, '')) / 100) * (d === 'h' ? w[0] : w[1])) : parseInt(v.replace(/px/, ''))) : null;
            },
            update: function(height, width) {
                var s = this;
                if (!s.d.data) {
                    return false;
                }
                s.d.origHeight = s.getVal(height, 'h');
                s.d.origWidth = s.getVal(width, 'w');
                s.d.data.hide();
                height && s.d.container.css('height', height);
                width && s.d.container.css('width', width);
                s.setContainerDimensions();
                s.d.data.show();
                s.o.focus && s.focus();
                s.unbindEvents();
                s.bindEvents();
            },
            setContainerDimensions: function() {
                var s = this,
                    badIE = browser.ie6 || browser.ie7;
                var ch = s.d.origHeight ? s.d.origHeight : browser.opera ? s.d.container.height() : s.getVal(badIE ? s.d.container[0].currentStyle['height'] : s.d.container.css('height'), 'h'),
                    cw = s.d.origWidth ? s.d.origWidth : browser.opera ? s.d.container.width() : s.getVal(badIE ? s.d.container[0].currentStyle['width'] : s.d.container.css('width'), 'w'),
                    dh = s.d.data.outerHeight(true),
                    dw = s.d.data.outerWidth(true);
                s.d.origHeight = s.d.origHeight || ch;
                s.d.origWidth = s.d.origWidth || cw;
                var mxoh = s.o.maxHeight ? s.getVal(s.o.maxHeight, 'h') : null,
                    mxow = s.o.maxWidth ? s.getVal(s.o.maxWidth, 'w') : null,
                    mh = mxoh && mxoh < w[0] ? mxoh : w[0],
                    mw = mxow && mxow < w[1] ? mxow : w[1];
                var moh = s.o.minHeight ? s.getVal(s.o.minHeight, 'h') : 'auto';
                if (!ch) {
                    if (!dh) {
                        ch = moh;
                    } else {
                        if (dh > mh) {
                            ch = mh;
                        } else if (s.o.minHeight && moh !== 'auto' && dh < moh) {
                            ch = moh;
                        } else {
                            ch = dh;
                        }
                    }
                } else {
                    ch = s.o.autoResize && ch > mh ? mh : ch < moh ? moh : ch;
                }
                var mow = s.o.minWidth ? s.getVal(s.o.minWidth, 'w') : 'auto';
                if (!cw) {
                    if (!dw) {
                        cw = mow;
                    } else {
                        if (dw > mw) {
                            cw = mw;
                        } else if (s.o.minWidth && mow !== 'auto' && dw < mow) {
                            cw = mow;
                        } else {
                            cw = dw;
                        }
                    }
                } else {
                    cw = s.o.autoResize && cw > mw ? mw : cw < mow ? mow : cw;
                }
                s.d.container.css({
                    height: ch,
                    width: cw
                });
                s.d.wrap.css({
                    overflow: (dh > ch || dw > cw) ? 'auto' : 'visible'
                });
                s.o.autoPosition && s.setPosition();
            },
            setPosition: function() {
                var s = this,
                    top, left, hc = (w[0] / 2) - (s.d.container.outerHeight(true) / 2),
                    vc = (w[1] / 2) - (s.d.container.outerWidth(true) / 2),
                    st = s.d.container.css('position') !== 'fixed' ? wndw.scrollTop() : 0;
                if (s.o.position && Object.prototype.toString.call(s.o.position) === '[object Array]') {
                    top = st + (s.o.position[0] || hc);
                    left = s.o.position[1] || vc;
                } else {
                    top = st + hc;
                    left = vc;
                }
                s.d.container.css({
                    left: left,
                    top: top
                });
            },
            watchTab: function(e) {
                var s = this;
                if ($(e.target).parents('.simplemodal-container').length > 0) {
                    s.inputs = $(':input:enabled:visible:first, :input:enabled:visible:last', s.d.data[0]);
                    if ((!e.shiftKey && e.target === s.inputs[s.inputs.length - 1]) || (e.shiftKey && e.target === s.inputs[0]) || s.inputs.length === 0) {
                        e.preventDefault();
                        var pos = e.shiftKey ? 'last' : 'first';
                        s.focus(pos);
                    }
                } else {
                    e.preventDefault();
                    s.focus();
                }
            },
            open: function() {
                var s = this;
                s.d.iframe && s.d.iframe.show();
                if ($.isFunction(s.o.onOpen)) {
                    s.o.onOpen.apply(s, [s.d]);
                } else {
                    s.d.overlay.show();
                    s.d.container.show();
                    s.d.data.show();
                }
                s.o.focus && s.focus();
                s.bindEvents();
            },
            close: function() {
                var s = this;
                if (!s.d.data) {
                    return false;
                }
                s.unbindEvents();
                if ($.isFunction(s.o.onClose) && !s.occb) {
                    s.occb = true;
                    s.o.onClose.apply(s, [s.d]);
                } else {
                    if (s.d.placeholder) {
                        var ph = $('#simplemodal-placeholder');
                        if (s.o.persist) {
                            ph.replaceWith(s.d.data.removeClass('simplemodal-data').css('display', s.display));
                        } else {
                            s.d.data.hide().remove();
                            ph.replaceWith(s.d.orig);
                        }
                    } else {
                        s.d.data.hide().remove();
                    }
                    s.d.container.hide().remove();
                    s.d.overlay.hide();
                    s.d.iframe && s.d.iframe.hide().remove();
                    s.d.overlay.remove();
                    s.d = {};
                }
            }
        };
    }));

; // extensions/Thumbnails.js
$(function() {
    var imageRetryDataElement = $("#image-retry-data");
    var pauseBetweenRequests = imageRetryDataElement ? imageRetryDataElement.data("image-retry-timer") : 1500;
    var retryMaxTimes = imageRetryDataElement ? imageRetryDataElement.data("image-retry-max-times") : 10;
    var gaLoggingPercent = imageRetryDataElement ? imageRetryDataElement.data('ga-logging-percent') : 0;
    var GoogleAnalyticsEvents_FireEvent = (window.GoogleAnalyticsEvents && GoogleAnalyticsEvents.FireEvent) || function() {};
    var GoogleAnalyticsEvents_FireEventPercentage = function(data) {
        if (Math.random() <= gaLoggingPercent / 100.0) {
            GoogleAnalyticsEvents_FireEvent(data);
        }
    }

    function getImgWithSrc(options) {
        var img = options.el.is("img") ? options.el : options.el.find("img");
        var imgWithSrc = img.length === 1 ? img : options.el.find("img.original-image");
        return imgWithSrc;
    }

    function handleFinalData(data, options) {
        var imgWithSrc = getImgWithSrc(options);
        var imageUrl;
        if (data.data != null && data.data[0].imageUrl != null) {
            imageUrl = data.data[0].imageUrl;
        } else {
            imageUrl = data.Url;
        }
        if (!imgWithSrc.attr("src") && imgWithSrc.hasClass("lazy")) {
            imgWithSrc.attr("data-original", imageUrl);
        } else {
            imgWithSrc.attr("src", imageUrl);
        }
        options.el.removeAttr("data-retry-url");
        options.el.trigger("thumbnailLoaded");
    }

    function logSuccess(options) {
        var gap = new Date().getTime() - options.start;
        Roblox.ThumbnailMetrics && Roblox.ThumbnailMetrics.logFinalThumbnailTime(gap);
        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenTime", "2D", "Success", gap]);
        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenRetries", "2D", "Success", options.retryCount]);
    }

    function logGiveUp(options) {
        var gap = new Date().getTime() - options.start;
        Roblox.ThumbnailMetrics && Roblox.ThumbnailMetrics.logThumbnailTimeout();
        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenRetries", "2D", "Gave Up", options.retryCount]);
        GoogleAnalyticsEvents_FireEventPercentage(["ThumbnailGenTime", "2D", "Gave Up", gap]);
    }

    function gotThumbnailData(data, options) {
        if (data.Final || data.data != null && data.data[0].state != null && data.data[0].state === "Completed") {
            if (options.realRegeneration) {
                logSuccess(options);
            }
            handleFinalData(data, options);
        } else {
            options.realRegeneration = true;
            options.retryCount++;
            if (options.retryCount < retryMaxTimes) {
                setTimeout(function() {
                    options.retryFunction(options);
                }, pauseBetweenRequests);
            } else {
                logGiveUp(options);
            }
        }
    }

    function getThumbnailData(options) {
        var url = options.el.data("retry-url");
        if (!url) {
            return;
        }
        $.ajax({
            url: url,
            dataType: "json",
            cache: false,
            crossDomain: true,
            xhrFields: {
                withCredentials: true
            },
            success: function(data) {
                gotThumbnailData(data, options);
            }
        });
    }
    $.fn.loadRobloxThumbnails = function() {
        return this.each(function() {
            var options = {
                retryCount: 0,
                realRegeneration: false,
                start: new Date().getTime(),
                el: $(this),
                retryFunction: getThumbnailData
            };
            var imgWithSrc = getImgWithSrc(options);
            imgWithSrc.one("load", function() {
                var imgLoadTime = new Date().getTime() - options.start;
                Roblox.ThumbnailMetrics && Roblox.ThumbnailMetrics.logFinalThumbnailTime(imgLoadTime, "2dThumbnailOnLoad");
            });
            setTimeout(function() {
                getThumbnailData(options);
            }, 0);
        });
    };
});

; // CookieUpgrader.js
if (typeof Roblox == "undefined") {
    Roblox = {};
}
if (typeof Roblox.CookieUpgrader == "undefined") {
    Roblox.CookieUpgrader = {}
};
Roblox.CookieUpgrader.domain = "";
Roblox.CookieUpgrader.oneMonthInMs = 1000 * 60 * 60 * 24 * 30;
Roblox.CookieUpgrader.upgrade = function(name, options) {
    function getCookie(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie !== "") {
            var cookies = document.cookie.split(";");
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                if (cookie.substring(0, name.length + 1) === (name + "=")) {
                    cookieValue = cookie.substring(name.length + 1);
                    break;
                }
            }
        }
        return cookieValue;
    }
    if (Roblox.CookieUpgrader.domain === "") {
        return;
    }
    var originalCookieValue = getCookie(name);
    if (originalCookieValue == null) {
        return;
    }
    try {
        var originalCookieLength = document.cookie.length;
        document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
        document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/; domain=" + window.location.host;
        if (document.cookie.length === originalCookieLength) {
            return;
        }
        var newCookieName = name;
        if (typeof options.newCookieName != "undefined") {
            newCookieName = options.newCookieName;
        }
        var cookieValue = getCookie(name);
        if (cookieValue != null) {
            if (typeof GoogleAnalyticsEvents != "undefined") {
                GoogleAnalyticsEvents.FireEvent(["CookieUpgrader", "DeletedRedundantCookie", name]);
            }
            var deletedCookieData = {
                cookieName: name,
                cookieValue: cookieValue
            };
            if (Roblox.EventStream) {
                Roblox.EventStream.SendEventWithTarget("CookieUpgrader", "DeletedRedundantCookie", deletedCookieData, Roblox.EventStream.TargetTypes.DIAGNOSTIC);
            }
            return;
        }
        var cookie = newCookieName + "=" + originalCookieValue + "; ";
        cookie += "expires=" + options.expires(originalCookieValue).toUTCString() + "; ";
        cookie += "path=/; domain=" + Roblox.CookieUpgrader.domain;
        document.cookie = cookie;
        if (typeof GoogleAnalyticsEvents != "undefined") {
            GoogleAnalyticsEvents.FireEvent(["CookieUpgrader", "ConvertedCookie", name]);
        }
        var convertedCookieData = {
            cookieName: name,
            cookieValue: originalCookieValue,
            newCookieName: newCookieName
        };
        if (Roblox.EventStream) {
            Roblox.EventStream.SendEventWithTarget("CookieUpgrader", "ConvertedCookie", convertedCookieData, Roblox.EventStream.TargetTypes.DIAGNOSTIC);
        }
    } catch (exp) {
        if (typeof GoogleAnalyticsEvents != "undefined") {
            GoogleAnalyticsEvents.FireEvent(["CookieUpgrader", "ExceptionDuringConvertOf" + name, exp.message]);
        }
    }
};
Roblox.CookieUpgrader.getExpirationFromCookieValue = function getExpirationFromCookieValue(propertyName, originalCookieValue) {
    var acquisitionTimeRegex = new RegExp(propertyName + "=(\\d+)\/(\\d+)\/(\\d+)");
    var originalCookieTimeMatches = originalCookieValue.match(acquisitionTimeRegex);
    var startTime = (new Date()).getTime();
    if (originalCookieTimeMatches != null && originalCookieTimeMatches.length != 0) {
        var originalCookieTime = new Date(originalCookieTimeMatches[3], originalCookieTimeMatches[1] - 1, originalCookieTimeMatches[2]);
        if (!isNaN(originalCookieTime.getTime())) {
            startTime = originalCookieTime.getTime();
        }
    }
    return new Date(startTime + Roblox.CookieUpgrader.oneMonthInMs);
};
Roblox.CookieUpgrader.thirtyDaysFromNow = function() {
    return new Date((new Date()).getTime() + Roblox.CookieUpgrader.oneMonthInMs);
};
Roblox.CookieUpgrader.thirtyYearsFromNow = function() {
    return new Date((new Date()).getTime() + 1000 * 60 * 60 * 24 * 365 * 30);
};
Roblox.CookieUpgrader.fourHoursFromNow = function() {
    return new Date((new Date()).getTime() + 1000 * 60 * 60 * 4);
};

; // utilities/stringFormat.js
var Roblox = Roblox || {};
Roblox.StringFormat = (function() {
    String.prototype.format = function() {
        var args = arguments;
        return this.replace(/\{(\d+)\}/g, function(m, n) {
            return args[n] || '';
        });
    };
})();

; // Tracking/SignupTrackingScript.js
var Roblox = Roblox || {};
Roblox.SignupTrackingScript = function() {
    function trackingScript(age, gender) {
        RobloxEventManager.triggerEvent('rbx_evt_signup', {
            age: age,
            gender: gender
        });
    }
    return {
        trackingScript: trackingScript
    };
}();

; // Tracking/AsyncGoogleOnScript.js
var Roblox = Roblox || {};
Roblox.AsyncGoogleOnScript = function() {
    function googleGoalFire(age, gender) {
        GoogleAnalyticsEvents && GoogleAnalyticsEvents.FireEvent(['Signup', 'Signup - Roblox', age, gender]);
    }
    return {
        googleGoalFire: googleGoalFire
    };
}();

; //Bundle detector
Roblox && Roblox.BundleDetector && Roblox.BundleDetector.bundleDetected('leanbase');