! function() {
    var r = {
            339: function(r, e, t) {
                "use strict";
                var n = this && this.__createBinding || (Object.create ? function(r, e, t, n) {
                        void 0 === n && (n = t), Object.defineProperty(r, n, {
                            enumerable: !0,
                            get: function() {
                                return e[t]
                            }
                        })
                    } : function(r, e, t, n) {
                        void 0 === n && (n = t), r[n] = e[t]
                    }),
                    a = this && this.__exportStar || function(r, e) {
                        for (var t in r) "default" === t || Object.prototype.hasOwnProperty.call(e, t) || n(e, r, t)
                    };
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), a(t(925), e), a(t(725), e), a(t(11), e), a(t(211), e)
            },
            925: function(r, e) {
                "use strict";
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), e.FoundationDark = void 0, e.FoundationDark = {
                    Color: {
                        Extended: {
                            Black: {
                                Black_0: "rgba(0, 0, 0, 0)",
                                Black_03: "rgba(0, 0, 0, 0.03)",
                                Black_05: "rgba(0, 0, 0, 0.05)",
                                Black_10: "rgba(0, 0, 0, 0.1)",
                                Black_15: "rgba(0, 0, 0, 0.15)",
                                Black_20: "rgba(0, 0, 0, 0.2)",
                                Black_30: "rgba(0, 0, 0, 0.3)",
                                Black_40: "rgba(0, 0, 0, 0.4)",
                                Black_50: "rgba(0, 0, 0, 0.5)",
                                Black_60: "rgba(0, 0, 0, 0.6)",
                                Black_70: "rgba(0, 0, 0, 0.7)",
                                Black_80: "rgba(0, 0, 0, 0.8)",
                                Black_85: "rgba(0, 0, 0, 0.85)",
                                Black_90: "rgba(0, 0, 0, 0.9)",
                                Black_95: "rgba(0, 0, 0, 0.95)",
                                Black_97: "rgba(0, 0, 0, 0.97)",
                                Black_100: "rgb(0, 0, 0)"
                            },
                            White: {
                                White_0: "rgba(255, 255, 255, 0)",
                                White_03: "rgba(255, 255, 255, 0.03)",
                                White_05: "rgba(255, 255, 255, 0.05)",
                                White_10: "rgba(255, 255, 255, 0.1)",
                                White_15: "rgba(255, 255, 255, 0.15)",
                                White_20: "rgba(255, 255, 255, 0.2)",
                                White_30: "rgba(255, 255, 255, 0.3)",
                                White_40: "rgba(255, 255, 255, 0.4)",
                                White_50: "rgba(255, 255, 255, 0.5)",
                                White_60: "rgba(255, 255, 255, 0.6)",
                                White_70: "rgba(255, 255, 255, 0.7)",
                                White_80: "rgba(255, 255, 255, 0.8)",
                                White_85: "rgba(255, 255, 255, 0.85)",
                                White_90: "rgba(255, 255, 255, 0.9)",
                                White_95: "rgba(255, 255, 255, 0.95)",
                                White_97: "rgba(255, 255, 255, 0.97)",
                                White_100: "rgb(255, 255, 255)"
                            },
                            Red: {
                                Red_100: "rgb(255, 234, 233)",
                                Red_200: "rgb(255, 223, 222)",
                                Red_300: "rgb(247, 205, 203)",
                                Red_400: "rgb(243, 178, 174)",
                                Red_500: "rgb(238, 151, 145)",
                                Red_600: "rgb(235, 121, 115)",
                                Red_700: "rgb(231, 87, 80)",
                                Red_800: "rgb(223, 40, 31)",
                                Red_900: "rgb(197, 18, 10)",
                                Red_1000: "rgb(164, 17, 9)",
                                Red_1100: "rgb(131, 15, 7)",
                                Red_1200: "rgb(100, 12, 5)",
                                Red_1300: "rgb(71, 8, 4)",
                                Red_1400: "rgb(40, 6, 3)"
                            },
                            Orange: {
                                Orange_100: "rgb(253, 232, 216)",
                                Orange_200: "rgb(252, 222, 199)",
                                Orange_300: "rgb(251, 206, 174)",
                                Orange_400: "rgb(251, 178, 134)",
                                Orange_500: "rgb(250, 148, 90)",
                                Orange_600: "rgb(245, 118, 48)",
                                Orange_700: "rgb(220, 100, 35)",
                                Orange_800: "rgb(192, 80, 20)",
                                Orange_900: "rgb(169, 67, 11)",
                                Orange_1000: "rgb(144, 51, 0)",
                                Orange_1100: "rgb(115, 40, 0)",
                                Orange_1200: "rgb(87, 30, 0)",
                                Orange_1300: "rgb(60, 21, 0)",
                                Orange_1400: "rgb(33, 13, 1)"
                            },
                            Yellow: {
                                Yellow_100: "rgb(253, 236, 193)",
                                Yellow_200: "rgb(250, 228, 170)",
                                Yellow_300: "rgb(247, 210, 115)",
                                Yellow_400: "rgb(242, 186, 42)",
                                Yellow_500: "rgb(219, 166, 31)",
                                Yellow_600: "rgb(196, 147, 21)",
                                Yellow_700: "rgb(174, 128, 11)",
                                Yellow_800: "rgb(151, 108, 0)",
                                Yellow_900: "rgb(129, 93, 0)",
                                Yellow_1000: "rgb(107, 76, 0)",
                                Yellow_1100: "rgb(83, 61, 2)",
                                Yellow_1200: "rgb(63, 45, 1)",
                                Yellow_1300: "rgb(44, 31, 0)",
                                Yellow_1400: "rgb(24, 17, 0)"
                            },
                            Green: {
                                Green_100: "rgb(208, 251, 227)",
                                Green_200: "rgb(176, 246, 208)",
                                Green_300: "rgb(142, 233, 182)",
                                Green_400: "rgb(101, 215, 157)",
                                Green_500: "rgb(57, 197, 130)",
                                Green_600: "rgb(29, 177, 106)",
                                Green_700: "rgb(12, 155, 90)",
                                Green_800: "rgb(1, 133, 75)",
                                Green_900: "rgb(2, 114, 64)",
                                Green_1000: "rgb(1, 95, 53)",
                                Green_1100: "rgb(0, 74, 41)",
                                Green_1200: "rgb(1, 56, 31)",
                                Green_1300: "rgb(10, 38, 18)",
                                Green_1400: "rgb(0, 22, 12)"
                            },
                            Turquoise: {
                                Turquoise_100: "rgb(200, 246, 255)",
                                Turquoise_200: "rgb(163, 239, 254)",
                                Turquoise_300: "rgb(126, 229, 248)",
                                Turquoise_400: "rgb(92, 210, 232)",
                                Turquoise_500: "rgb(57, 189, 216)",
                                Turquoise_600: "rgb(22, 169, 199)",
                                Turquoise_700: "rgb(4, 148, 178)",
                                Turquoise_800: "rgb(18, 125, 152)",
                                Turquoise_900: "rgb(5, 108, 130)",
                                Turquoise_1000: "rgb(5, 90, 106)",
                                Turquoise_1100: "rgb(4, 71, 84)",
                                Turquoise_1200: "rgb(2, 53, 63)",
                                Turquoise_1300: "rgb(2, 37, 44)",
                                Turquoise_1400: "rgb(2, 20, 24)"
                            },
                            Blue: {
                                Blue_100: "rgb(235, 241, 255)",
                                Blue_200: "rgb(204, 221, 255)",
                                Blue_300: "rgb(173, 201, 255)",
                                Blue_400: "rgb(143, 180, 255)",
                                Blue_500: "rgb(112, 160, 255)",
                                Blue_600: "rgb(82, 139, 255)",
                                Blue_700: "rgb(51, 95, 255)",
                                Blue_800: "rgb(20, 70, 255)",
                                Blue_900: "rgb(0, 53, 245)",
                                Blue_1000: "rgb(0, 45, 214)",
                                Blue_1100: "rgb(0, 39, 184)",
                                Blue_1200: "rgb(0, 34, 153)",
                                Blue_1300: "rgb(0, 27, 122)",
                                Blue_1400: "rgb(0, 20, 92)"
                            },
                            Purple: {
                                Purple_100: "rgb(241, 231, 255)",
                                Purple_200: "rgb(233, 222, 251)",
                                Purple_300: "rgb(226, 206, 253)",
                                Purple_400: "rgb(212, 181, 252)",
                                Purple_500: "rgb(197, 156, 249)",
                                Purple_600: "rgb(182, 130, 247)",
                                Purple_700: "rgb(167, 102, 245)",
                                Purple_800: "rgb(147, 72, 240)",
                                Purple_900: "rgb(130, 46, 231)",
                                Purple_1000: "rgb(108, 33, 198)",
                                Purple_1100: "rgb(86, 20, 165)",
                                Purple_1200: "rgb(65, 8, 134)",
                                Purple_1300: "rgb(45, 4, 96)",
                                Purple_1400: "rgb(28, 2, 59)"
                            },
                            Magenta: {
                                Magenta_100: "rgb(253, 232, 249)",
                                Magenta_200: "rgb(253, 221, 253)",
                                Magenta_300: "rgb(245, 200, 252)",
                                Magenta_400: "rgb(239, 170, 250)",
                                Magenta_500: "rgb(232, 139, 248)",
                                Magenta_600: "rgb(223, 106, 247)",
                                Magenta_700: "rgb(213, 64, 245)",
                                Magenta_800: "rgb(192, 10, 232)",
                                Magenta_900: "rgb(165, 14, 200)",
                                Magenta_1000: "rgb(138, 12, 167)",
                                Magenta_1100: "rgb(110, 7, 133)",
                                Magenta_1200: "rgb(84, 4, 103)",
                                Magenta_1300: "rgb(60, 2, 74)",
                                Magenta_1400: "rgb(35, 4, 42)"
                            },
                            Pink: {
                                Pink_100: "rgb(255, 230, 242)",
                                Pink_200: "rgb(254, 220, 236)",
                                Pink_300: "rgb(250, 202, 224)",
                                Pink_400: "rgb(247, 173, 207)",
                                Pink_500: "rgb(243, 143, 184)",
                                Pink_600: "rgb(238, 114, 161)",
                                Pink_700: "rgb(231, 78, 144)",
                                Pink_800: "rgb(205, 55, 123)",
                                Pink_900: "rgb(180, 43, 106)",
                                Pink_1000: "rgb(153, 29, 88)",
                                Pink_1100: "rgb(99, 3, 53)",
                                Pink_1200: "rgb(99, 3, 53)",
                                Pink_1300: "rgb(70, 4, 36)",
                                Pink_1400: "rgb(43, 2, 21)"
                            },
                            Gray: {
                                Gray_100: "rgb(247, 247, 248)",
                                Gray_200: "rgb(238, 239, 241)",
                                Gray_300: "rgb(230, 231, 234)",
                                Gray_400: "rgb(213, 215, 221)",
                                Gray_500: "rgb(188, 190, 200)",
                                Gray_600: "rgb(106, 111, 129)",
                                Gray_700: "rgb(73, 77, 90)",
                                Gray_800: "rgb(53, 55, 65)",
                                Gray_900: "rgb(39, 41, 48)",
                                Gray_1000: "rgb(32, 34, 39)",
                                Gray_1100: "rgb(25, 26, 31)",
                                Gray_1200: "rgb(18, 18, 21)"
                            }
                        },
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(18, 18, 21)",
                            Surface_100: "rgb(25, 26, 31)",
                            Surface_200: "rgb(32, 34, 39)",
                            Surface_300: "rgb(39, 41, 48)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(18, 18, 21, 0.92)",
                            OverMedia_100: "rgba(25, 26, 31, 0.92)",
                            OverMedia_200: "rgba(32, 34, 39, 0.92)",
                            OverMedia_300: "rgba(39, 41, 48, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(208, 217, 251, 0.04)",
                            Shift_200: "rgba(208, 217, 251, 0.08)",
                            Shift_300: "rgba(208, 217, 251, 0.12)",
                            Shift_400: "rgba(208, 217, 251, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(247, 247, 248)",
                            Default: "rgb(213, 215, 221)",
                            Muted: "rgb(188, 190, 200)",
                            Link: "rgb(82, 139, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(208, 217, 251, 0.16)",
                            Default: "rgba(208, 217, 251, 0.12)",
                            Muted: "rgba(208, 217, 251, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(247, 247, 248)",
                            Neutral: "rgb(188, 190, 200)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(208, 217, 251, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.75)",
                            Backdrop: "rgba(10, 10, 14, 0.75)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(18, 18, 21)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(255, 255, 255)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(208, 217, 251, 0.08)",
                            Press: "rgba(208, 217, 251, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.4)",
                            Foreground: "rgb(235, 241, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgb(213, 215, 221)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(240, 68, 51)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Config: {
                        Theme: {
                            Name: "Foundation",
                            IsFoundation: "true",
                            IsUIBlox: "false"
                        },
                        ColorMode: {
                            Name: "Dark",
                            IsDark: "true",
                            IsLight: "false"
                        },
                        UI: {
                            Interval: 4,
                            Scale: 1,
                            StrokeBase: 1
                        },
                        Text: {
                            Interval: 4,
                            Scale: 1,
                            Font: '"Builder Sans"',
                            NominalScale: 1,
                            InverseScale: 1
                        }
                    },
                    DarkMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(18, 18, 21)",
                            Surface_100: "rgb(25, 26, 31)",
                            Surface_200: "rgb(32, 34, 39)",
                            Surface_300: "rgb(39, 41, 48)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(18, 18, 21, 0.92)",
                            OverMedia_100: "rgba(25, 26, 31, 0.92)",
                            OverMedia_200: "rgba(32, 34, 39, 0.92)",
                            OverMedia_300: "rgba(39, 41, 48, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(208, 217, 251, 0.04)",
                            Shift_200: "rgba(208, 217, 251, 0.08)",
                            Shift_300: "rgba(208, 217, 251, 0.12)",
                            Shift_400: "rgba(208, 217, 251, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(247, 247, 248)",
                            Default: "rgb(213, 215, 221)",
                            Muted: "rgb(188, 190, 200)",
                            Link: "rgb(82, 139, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(208, 217, 251, 0.16)",
                            Default: "rgba(208, 217, 251, 0.12)",
                            Muted: "rgba(208, 217, 251, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(247, 247, 248)",
                            Neutral: "rgb(188, 190, 200)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(208, 217, 251, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.75)",
                            Backdrop: "rgba(10, 10, 14, 0.75)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(18, 18, 21)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(255, 255, 255)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(208, 217, 251, 0.08)",
                            Press: "rgba(208, 217, 251, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.4)",
                            Foreground: "rgb(235, 241, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgb(213, 215, 221)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(240, 68, 51)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    LightMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(255, 255, 255)",
                            Surface_100: "rgb(247, 247, 248)",
                            Surface_200: "rgb(255, 255, 255)",
                            Surface_300: "rgb(247, 247, 248)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.92)",
                            OverMedia_100: "rgba(247, 247, 248, 0.92)",
                            OverMedia_200: "rgba(255, 255, 255, 0.92)",
                            OverMedia_300: "rgba(247, 247, 248, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(27, 37, 75, 0.04)",
                            Shift_200: "rgba(27, 37, 75, 0.08)",
                            Shift_300: "rgba(27, 37, 75, 0.12)",
                            Shift_400: "rgba(27, 37, 75, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(32, 34, 39)",
                            Default: "rgb(73, 77, 90)",
                            Muted: "rgb(106, 111, 129)",
                            Link: "rgb(20, 70, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(27, 37, 75, 0.16)",
                            Default: "rgba(27, 37, 75, 0.12)",
                            Muted: "rgba(27, 37, 75, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(32, 34, 39)",
                            Neutral: "rgb(73, 77, 90)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(27, 37, 75, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.5)",
                            Backdrop: "rgba(10, 10, 14, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(27, 37, 75, 0.04)"
                        },
                        Selection: {
                            Start: "rgb(51, 95, 255)",
                            End: "rgb(51, 95, 255)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(27, 37, 75, 0.08)",
                            Press: "rgba(27, 37, 75, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.3)",
                            Foreground: "rgb(0, 20, 92)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgb(73, 77, 90)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(217, 28, 21)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Inverse: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(255, 255, 255)",
                            Surface_100: "rgb(247, 247, 248)",
                            Surface_200: "rgb(255, 255, 255)",
                            Surface_300: "rgb(247, 247, 248)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.92)",
                            OverMedia_100: "rgba(247, 247, 248, 0.92)",
                            OverMedia_200: "rgba(255, 255, 255, 0.92)",
                            OverMedia_300: "rgba(247, 247, 248, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(27, 37, 75, 0.04)",
                            Shift_200: "rgba(27, 37, 75, 0.08)",
                            Shift_300: "rgba(27, 37, 75, 0.12)",
                            Shift_400: "rgba(27, 37, 75, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(32, 34, 39)",
                            Default: "rgb(73, 77, 90)",
                            Muted: "rgb(106, 111, 129)",
                            Link: "rgb(20, 70, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(27, 37, 75, 0.16)",
                            Default: "rgba(27, 37, 75, 0.12)",
                            Muted: "rgba(27, 37, 75, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(32, 34, 39)",
                            Neutral: "rgb(73, 77, 90)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(27, 37, 75, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.5)",
                            Backdrop: "rgba(10, 10, 14, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(27, 37, 75, 0.04)"
                        },
                        Selection: {
                            Start: "rgb(51, 95, 255)",
                            End: "rgb(51, 95, 255)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(27, 37, 75, 0.08)",
                            Press: "rgba(27, 37, 75, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.3)",
                            Foreground: "rgb(0, 20, 92)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgb(73, 77, 90)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(217, 28, 21)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Size: {
                        Size_0: 0,
                        Size_50: 2,
                        Size_100: 4,
                        Size_150: 6,
                        Size_200: 8,
                        Size_250: 10,
                        Size_300: 12,
                        Size_350: 14,
                        Size_400: 16,
                        Size_500: 20,
                        Size_600: 24,
                        Size_700: 28,
                        Size_800: 32,
                        Size_900: 36,
                        Size_1000: 40,
                        Size_1100: 44,
                        Size_1200: 48,
                        Size_1300: 52,
                        Size_1400: 56,
                        Size_1500: 60,
                        Size_1600: 64,
                        Size_1700: 68,
                        Size_1800: 72,
                        Size_1900: 76,
                        Size_2000: 80,
                        Size_2100: 84,
                        Size_2200: 88,
                        Size_2300: 92,
                        Size_2400: 96,
                        Size_2500: 100,
                        Size_2600: 104,
                        Size_2700: 108,
                        Size_2800: 112,
                        Size_2900: 116,
                        Size_3000: 120
                    },
                    Padding: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Margin: {
                        None: 0,
                        Small: 20,
                        Medium: 24,
                        Large: 48
                    },
                    Gap: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Gutter: {
                        None: 0,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Radius: {
                        None: 0,
                        XSmall: 2,
                        Small: 4,
                        Medium: 8,
                        Large: 16,
                        Circle: 9999
                    },
                    Stroke: {
                        None: 0,
                        Thin: .5,
                        Standard: 1,
                        Thick: 1.5,
                        Thicker: 3
                    },
                    InputSize: {
                        XSmall: 24,
                        Small: 32,
                        Medium: 40,
                        Large: 48
                    },
                    IconSize: {
                        XSmall: 12,
                        Small: 16,
                        Medium: 20,
                        Large: 24,
                        XLarge: 28
                    },
                    ToggleSize: {
                        XSmall: 16,
                        Small: 20,
                        Medium: 24,
                        Large: 28
                    },
                    LineHeight: {
                        LineHeight_100: 1,
                        LineHeight_120: 1.2,
                        LineHeight_130: 1.3,
                        LineHeight_140: 1.4
                    },
                    LetterSpacing: {
                        Tight: -.01,
                        Default: 0,
                        Loose: .01
                    },
                    FontSize: {
                        FontSize_200: 8,
                        FontSize_250: 10,
                        FontSize_300: 12,
                        FontSize_350: 14,
                        FontSize_400: 16,
                        FontSize_500: 20,
                        FontSize_600: 24,
                        FontSize_700: 28,
                        FontSize_800: 32,
                        FontSize_900: 36,
                        FontSize_1000: 40,
                        FontSize_1100: 44,
                        FontSize_1200: 48,
                        FontSize_1300: 52,
                        FontSize_1400: 56,
                        FontSize_1500: 60,
                        FontSize_1600: 64,
                        FontSize_1700: 68,
                        FontSize_1800: 72,
                        FontSize_1900: 76,
                        FontSize_2000: 80,
                        FontSize_2100: 84,
                        FontSize_2200: 88,
                        FontSize_2300: 92,
                        FontSize_2400: 96,
                        FontSize_2500: 100,
                        FontSize_2600: 104,
                        FontSize_2700: 108,
                        FontSize_2800: 112,
                        FontSize_2900: 116,
                        FontSize_3000: 120
                    },
                    FontWeight: {
                        FontWeight_300: "300",
                        FontWeight_400: "400",
                        FontWeight_500: "500",
                        FontWeight_600: "600",
                        FontWeight_700: "700",
                        FontWeight_800: "800"
                    },
                    Typography: {
                        DisplayLarge: {
                            Font: '700 80/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 80,
                            LineHeight: 1.2
                        },
                        DisplayMedium: {
                            Font: '700 56/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 56,
                            LineHeight: 1.2
                        },
                        DisplaySmall: {
                            Font: '700 40/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 40,
                            LineHeight: 1.2
                        },
                        HeadingLarge: {
                            Font: '700 28/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 28,
                            LineHeight: 1.2
                        },
                        HeadingMedium: {
                            Font: '700 24/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 24,
                            LineHeight: 1.2
                        },
                        HeadingSmall: {
                            Font: '700 20/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 20,
                            LineHeight: 1.2
                        },
                        TitleLarge: {
                            Font: '700 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        TitleMedium: {
                            Font: '700 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        TitleSmall: {
                            Font: '700 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        LabelLarge: {
                            Font: '600 16/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 16,
                            LineHeight: 1
                        },
                        LabelMedium: {
                            Font: '600 14/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1
                        },
                        LabelSmall: {
                            Font: '600 12/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1
                        },
                        BodyLarge: {
                            Font: '400 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        BodyMedium: {
                            Font: '400 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        BodySmall: {
                            Font: '400 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionLarge: {
                            Font: '600 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        CaptionMedium: {
                            Font: '600 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionSmall: {
                            Font: '600 10/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 10,
                            LineHeight: 1.4
                        }
                    },
                    Time: {
                        Time_50: .05,
                        Time_100: .1,
                        Time_200: .2,
                        Time_300: .3,
                        Time_400: .4,
                        Time_500: .5,
                        Time_600: .6,
                        Time_700: .7,
                        Time_800: .8,
                        Time_900: .9,
                        Time_1000: 1
                    },
                    Ease: {
                        StandardIn: {
                            Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                            Raw: [.8, 0, .4, 1]
                        },
                        StandardOut: {
                            Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                            Raw: [.2, 0, 0, 1]
                        },
                        ExpressiveIn: {
                            Bezier: "cubic-bezier(0.25, 0, 0.5, -1)",
                            Raw: [.25, 0, .5, -1]
                        },
                        ExpressiveOut: {
                            Bezier: "cubic-bezier(0.25, 1.5, 0.5, 1)",
                            Raw: [.25, 1.5, .5, 1]
                        },
                        Linear: {
                            Bezier: "cubic-bezier(0, 0, 1, 1)",
                            Raw: [0, 0, 1, 1]
                        }
                    }
                }
            },
            725: function(r, e) {
                "use strict";
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), e.FoundationLight = void 0, e.FoundationLight = {
                    Color: {
                        Extended: {
                            Black: {
                                Black_0: "rgba(0, 0, 0, 0)",
                                Black_03: "rgba(0, 0, 0, 0.03)",
                                Black_05: "rgba(0, 0, 0, 0.05)",
                                Black_10: "rgba(0, 0, 0, 0.1)",
                                Black_15: "rgba(0, 0, 0, 0.15)",
                                Black_20: "rgba(0, 0, 0, 0.2)",
                                Black_30: "rgba(0, 0, 0, 0.3)",
                                Black_40: "rgba(0, 0, 0, 0.4)",
                                Black_50: "rgba(0, 0, 0, 0.5)",
                                Black_60: "rgba(0, 0, 0, 0.6)",
                                Black_70: "rgba(0, 0, 0, 0.7)",
                                Black_80: "rgba(0, 0, 0, 0.8)",
                                Black_85: "rgba(0, 0, 0, 0.85)",
                                Black_90: "rgba(0, 0, 0, 0.9)",
                                Black_95: "rgba(0, 0, 0, 0.95)",
                                Black_97: "rgba(0, 0, 0, 0.97)",
                                Black_100: "rgb(0, 0, 0)"
                            },
                            White: {
                                White_0: "rgba(255, 255, 255, 0)",
                                White_03: "rgba(255, 255, 255, 0.03)",
                                White_05: "rgba(255, 255, 255, 0.05)",
                                White_10: "rgba(255, 255, 255, 0.1)",
                                White_15: "rgba(255, 255, 255, 0.15)",
                                White_20: "rgba(255, 255, 255, 0.2)",
                                White_30: "rgba(255, 255, 255, 0.3)",
                                White_40: "rgba(255, 255, 255, 0.4)",
                                White_50: "rgba(255, 255, 255, 0.5)",
                                White_60: "rgba(255, 255, 255, 0.6)",
                                White_70: "rgba(255, 255, 255, 0.7)",
                                White_80: "rgba(255, 255, 255, 0.8)",
                                White_85: "rgba(255, 255, 255, 0.85)",
                                White_90: "rgba(255, 255, 255, 0.9)",
                                White_95: "rgba(255, 255, 255, 0.95)",
                                White_97: "rgba(255, 255, 255, 0.97)",
                                White_100: "rgb(255, 255, 255)"
                            },
                            Red: {
                                Red_100: "rgb(255, 234, 233)",
                                Red_200: "rgb(255, 223, 222)",
                                Red_300: "rgb(247, 205, 203)",
                                Red_400: "rgb(243, 178, 174)",
                                Red_500: "rgb(238, 151, 145)",
                                Red_600: "rgb(235, 121, 115)",
                                Red_700: "rgb(231, 87, 80)",
                                Red_800: "rgb(223, 40, 31)",
                                Red_900: "rgb(197, 18, 10)",
                                Red_1000: "rgb(164, 17, 9)",
                                Red_1100: "rgb(131, 15, 7)",
                                Red_1200: "rgb(100, 12, 5)",
                                Red_1300: "rgb(71, 8, 4)",
                                Red_1400: "rgb(40, 6, 3)"
                            },
                            Orange: {
                                Orange_100: "rgb(253, 232, 216)",
                                Orange_200: "rgb(252, 222, 199)",
                                Orange_300: "rgb(251, 206, 174)",
                                Orange_400: "rgb(251, 178, 134)",
                                Orange_500: "rgb(250, 148, 90)",
                                Orange_600: "rgb(245, 118, 48)",
                                Orange_700: "rgb(220, 100, 35)",
                                Orange_800: "rgb(192, 80, 20)",
                                Orange_900: "rgb(169, 67, 11)",
                                Orange_1000: "rgb(144, 51, 0)",
                                Orange_1100: "rgb(115, 40, 0)",
                                Orange_1200: "rgb(87, 30, 0)",
                                Orange_1300: "rgb(60, 21, 0)",
                                Orange_1400: "rgb(33, 13, 1)"
                            },
                            Yellow: {
                                Yellow_100: "rgb(253, 236, 193)",
                                Yellow_200: "rgb(250, 228, 170)",
                                Yellow_300: "rgb(247, 210, 115)",
                                Yellow_400: "rgb(242, 186, 42)",
                                Yellow_500: "rgb(219, 166, 31)",
                                Yellow_600: "rgb(196, 147, 21)",
                                Yellow_700: "rgb(174, 128, 11)",
                                Yellow_800: "rgb(151, 108, 0)",
                                Yellow_900: "rgb(129, 93, 0)",
                                Yellow_1000: "rgb(107, 76, 0)",
                                Yellow_1100: "rgb(83, 61, 2)",
                                Yellow_1200: "rgb(63, 45, 1)",
                                Yellow_1300: "rgb(44, 31, 0)",
                                Yellow_1400: "rgb(24, 17, 0)"
                            },
                            Green: {
                                Green_100: "rgb(208, 251, 227)",
                                Green_200: "rgb(176, 246, 208)",
                                Green_300: "rgb(142, 233, 182)",
                                Green_400: "rgb(101, 215, 157)",
                                Green_500: "rgb(57, 197, 130)",
                                Green_600: "rgb(29, 177, 106)",
                                Green_700: "rgb(12, 155, 90)",
                                Green_800: "rgb(1, 133, 75)",
                                Green_900: "rgb(2, 114, 64)",
                                Green_1000: "rgb(1, 95, 53)",
                                Green_1100: "rgb(0, 74, 41)",
                                Green_1200: "rgb(1, 56, 31)",
                                Green_1300: "rgb(10, 38, 18)",
                                Green_1400: "rgb(0, 22, 12)"
                            },
                            Turquoise: {
                                Turquoise_100: "rgb(200, 246, 255)",
                                Turquoise_200: "rgb(163, 239, 254)",
                                Turquoise_300: "rgb(126, 229, 248)",
                                Turquoise_400: "rgb(92, 210, 232)",
                                Turquoise_500: "rgb(57, 189, 216)",
                                Turquoise_600: "rgb(22, 169, 199)",
                                Turquoise_700: "rgb(4, 148, 178)",
                                Turquoise_800: "rgb(18, 125, 152)",
                                Turquoise_900: "rgb(5, 108, 130)",
                                Turquoise_1000: "rgb(5, 90, 106)",
                                Turquoise_1100: "rgb(4, 71, 84)",
                                Turquoise_1200: "rgb(2, 53, 63)",
                                Turquoise_1300: "rgb(2, 37, 44)",
                                Turquoise_1400: "rgb(2, 20, 24)"
                            },
                            Blue: {
                                Blue_100: "rgb(235, 241, 255)",
                                Blue_200: "rgb(204, 221, 255)",
                                Blue_300: "rgb(173, 201, 255)",
                                Blue_400: "rgb(143, 180, 255)",
                                Blue_500: "rgb(112, 160, 255)",
                                Blue_600: "rgb(82, 139, 255)",
                                Blue_700: "rgb(51, 95, 255)",
                                Blue_800: "rgb(20, 70, 255)",
                                Blue_900: "rgb(0, 53, 245)",
                                Blue_1000: "rgb(0, 45, 214)",
                                Blue_1100: "rgb(0, 39, 184)",
                                Blue_1200: "rgb(0, 34, 153)",
                                Blue_1300: "rgb(0, 27, 122)",
                                Blue_1400: "rgb(0, 20, 92)"
                            },
                            Purple: {
                                Purple_100: "rgb(241, 231, 255)",
                                Purple_200: "rgb(233, 222, 251)",
                                Purple_300: "rgb(226, 206, 253)",
                                Purple_400: "rgb(212, 181, 252)",
                                Purple_500: "rgb(197, 156, 249)",
                                Purple_600: "rgb(182, 130, 247)",
                                Purple_700: "rgb(167, 102, 245)",
                                Purple_800: "rgb(147, 72, 240)",
                                Purple_900: "rgb(130, 46, 231)",
                                Purple_1000: "rgb(108, 33, 198)",
                                Purple_1100: "rgb(86, 20, 165)",
                                Purple_1200: "rgb(65, 8, 134)",
                                Purple_1300: "rgb(45, 4, 96)",
                                Purple_1400: "rgb(28, 2, 59)"
                            },
                            Magenta: {
                                Magenta_100: "rgb(253, 232, 249)",
                                Magenta_200: "rgb(253, 221, 253)",
                                Magenta_300: "rgb(245, 200, 252)",
                                Magenta_400: "rgb(239, 170, 250)",
                                Magenta_500: "rgb(232, 139, 248)",
                                Magenta_600: "rgb(223, 106, 247)",
                                Magenta_700: "rgb(213, 64, 245)",
                                Magenta_800: "rgb(192, 10, 232)",
                                Magenta_900: "rgb(165, 14, 200)",
                                Magenta_1000: "rgb(138, 12, 167)",
                                Magenta_1100: "rgb(110, 7, 133)",
                                Magenta_1200: "rgb(84, 4, 103)",
                                Magenta_1300: "rgb(60, 2, 74)",
                                Magenta_1400: "rgb(35, 4, 42)"
                            },
                            Pink: {
                                Pink_100: "rgb(255, 230, 242)",
                                Pink_200: "rgb(254, 220, 236)",
                                Pink_300: "rgb(250, 202, 224)",
                                Pink_400: "rgb(247, 173, 207)",
                                Pink_500: "rgb(243, 143, 184)",
                                Pink_600: "rgb(238, 114, 161)",
                                Pink_700: "rgb(231, 78, 144)",
                                Pink_800: "rgb(205, 55, 123)",
                                Pink_900: "rgb(180, 43, 106)",
                                Pink_1000: "rgb(153, 29, 88)",
                                Pink_1100: "rgb(99, 3, 53)",
                                Pink_1200: "rgb(99, 3, 53)",
                                Pink_1300: "rgb(70, 4, 36)",
                                Pink_1400: "rgb(43, 2, 21)"
                            },
                            Gray: {
                                Gray_100: "rgb(247, 247, 248)",
                                Gray_200: "rgb(238, 239, 241)",
                                Gray_300: "rgb(230, 231, 234)",
                                Gray_400: "rgb(213, 215, 221)",
                                Gray_500: "rgb(188, 190, 200)",
                                Gray_600: "rgb(106, 111, 129)",
                                Gray_700: "rgb(73, 77, 90)",
                                Gray_800: "rgb(53, 55, 65)",
                                Gray_900: "rgb(39, 41, 48)",
                                Gray_1000: "rgb(32, 34, 39)",
                                Gray_1100: "rgb(25, 26, 31)",
                                Gray_1200: "rgb(18, 18, 21)"
                            }
                        },
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(255, 255, 255)",
                            Surface_100: "rgb(247, 247, 248)",
                            Surface_200: "rgb(255, 255, 255)",
                            Surface_300: "rgb(247, 247, 248)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.92)",
                            OverMedia_100: "rgba(247, 247, 248, 0.92)",
                            OverMedia_200: "rgba(255, 255, 255, 0.92)",
                            OverMedia_300: "rgba(247, 247, 248, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(27, 37, 75, 0.04)",
                            Shift_200: "rgba(27, 37, 75, 0.08)",
                            Shift_300: "rgba(27, 37, 75, 0.12)",
                            Shift_400: "rgba(27, 37, 75, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(32, 34, 39)",
                            Default: "rgb(73, 77, 90)",
                            Muted: "rgb(106, 111, 129)",
                            Link: "rgb(20, 70, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(27, 37, 75, 0.16)",
                            Default: "rgba(27, 37, 75, 0.12)",
                            Muted: "rgba(27, 37, 75, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(32, 34, 39)",
                            Neutral: "rgb(73, 77, 90)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(27, 37, 75, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.5)",
                            Backdrop: "rgba(10, 10, 14, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(27, 37, 75, 0.04)"
                        },
                        Selection: {
                            Start: "rgb(51, 95, 255)",
                            End: "rgb(51, 95, 255)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(27, 37, 75, 0.08)",
                            Press: "rgba(27, 37, 75, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.3)",
                            Foreground: "rgb(0, 20, 92)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgb(73, 77, 90)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(217, 28, 21)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Config: {
                        Theme: {
                            Name: "Foundation",
                            IsFoundation: "true",
                            IsUIBlox: "false"
                        },
                        ColorMode: {
                            Name: "Light",
                            IsDark: "false",
                            IsLight: "true"
                        },
                        UI: {
                            Interval: 4,
                            Scale: 1,
                            StrokeBase: 1
                        },
                        Text: {
                            Interval: 4,
                            Scale: 1,
                            Font: '"Builder Sans"',
                            NominalScale: 1,
                            InverseScale: 1
                        }
                    },
                    DarkMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(18, 18, 21)",
                            Surface_100: "rgb(25, 26, 31)",
                            Surface_200: "rgb(32, 34, 39)",
                            Surface_300: "rgb(39, 41, 48)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(18, 18, 21, 0.92)",
                            OverMedia_100: "rgba(25, 26, 31, 0.92)",
                            OverMedia_200: "rgba(32, 34, 39, 0.92)",
                            OverMedia_300: "rgba(39, 41, 48, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(208, 217, 251, 0.04)",
                            Shift_200: "rgba(208, 217, 251, 0.08)",
                            Shift_300: "rgba(208, 217, 251, 0.12)",
                            Shift_400: "rgba(208, 217, 251, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(247, 247, 248)",
                            Default: "rgb(213, 215, 221)",
                            Muted: "rgb(188, 190, 200)",
                            Link: "rgb(82, 139, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(208, 217, 251, 0.16)",
                            Default: "rgba(208, 217, 251, 0.12)",
                            Muted: "rgba(208, 217, 251, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(247, 247, 248)",
                            Neutral: "rgb(188, 190, 200)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(208, 217, 251, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.75)",
                            Backdrop: "rgba(10, 10, 14, 0.75)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(18, 18, 21)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(255, 255, 255)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(208, 217, 251, 0.08)",
                            Press: "rgba(208, 217, 251, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.4)",
                            Foreground: "rgb(235, 241, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgb(213, 215, 221)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(240, 68, 51)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    LightMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(255, 255, 255)",
                            Surface_100: "rgb(247, 247, 248)",
                            Surface_200: "rgb(255, 255, 255)",
                            Surface_300: "rgb(247, 247, 248)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.92)",
                            OverMedia_100: "rgba(247, 247, 248, 0.92)",
                            OverMedia_200: "rgba(255, 255, 255, 0.92)",
                            OverMedia_300: "rgba(247, 247, 248, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(27, 37, 75, 0.04)",
                            Shift_200: "rgba(27, 37, 75, 0.08)",
                            Shift_300: "rgba(27, 37, 75, 0.12)",
                            Shift_400: "rgba(27, 37, 75, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(32, 34, 39)",
                            Default: "rgb(73, 77, 90)",
                            Muted: "rgb(106, 111, 129)",
                            Link: "rgb(20, 70, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(27, 37, 75, 0.16)",
                            Default: "rgba(27, 37, 75, 0.12)",
                            Muted: "rgba(27, 37, 75, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(32, 34, 39)",
                            Neutral: "rgb(73, 77, 90)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(27, 37, 75, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.5)",
                            Backdrop: "rgba(10, 10, 14, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(27, 37, 75, 0.04)"
                        },
                        Selection: {
                            Start: "rgb(51, 95, 255)",
                            End: "rgb(51, 95, 255)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(27, 37, 75, 0.08)",
                            Press: "rgba(27, 37, 75, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.3)",
                            Foreground: "rgb(0, 20, 92)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(32, 34, 39)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgb(73, 77, 90)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(27, 37, 75, 0.12)",
                            Foreground: "rgb(217, 28, 21)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Inverse: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(18, 18, 21)",
                            Surface_100: "rgb(25, 26, 31)",
                            Surface_200: "rgb(32, 34, 39)",
                            Surface_300: "rgb(39, 41, 48)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(18, 18, 21, 0.92)",
                            OverMedia_100: "rgba(25, 26, 31, 0.92)",
                            OverMedia_200: "rgba(32, 34, 39, 0.92)",
                            OverMedia_300: "rgba(39, 41, 48, 0.92)"
                        },
                        Shift: {
                            Shift_100: "rgba(208, 217, 251, 0.04)",
                            Shift_200: "rgba(208, 217, 251, 0.08)",
                            Shift_300: "rgba(208, 217, 251, 0.12)",
                            Shift_400: "rgba(208, 217, 251, 0.16)"
                        },
                        Content: {
                            Emphasis: "rgb(247, 247, 248)",
                            Default: "rgb(213, 215, 221)",
                            Muted: "rgb(188, 190, 200)",
                            Link: "rgb(82, 139, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(208, 217, 251, 0.16)",
                            Default: "rgba(208, 217, 251, 0.12)",
                            Muted: "rgba(208, 217, 251, 0.08)"
                        },
                        System: {
                            Contrast: "rgb(247, 247, 248)",
                            Neutral: "rgb(188, 190, 200)",
                            Emphasis: "rgb(51, 95, 255)",
                            Success: "rgb(57, 197, 130)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(223, 40, 31)"
                        },
                        Common: {
                            Shimmer: "rgba(208, 217, 251, 0.12)",
                            Scrim: "rgba(10, 10, 14, 0.75)",
                            Backdrop: "rgba(10, 10, 14, 0.75)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(18, 18, 21)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(255, 255, 255)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(208, 217, 251, 0.08)",
                            Press: "rgba(208, 217, 251, 0.12)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(51, 95, 255)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgba(51, 95, 255, 0.4)",
                            Foreground: "rgb(235, 241, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(247, 247, 248)",
                            Foreground: "rgb(32, 34, 39)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgb(213, 215, 221)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 247, 248)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(208, 217, 251, 0.12)",
                            Foreground: "rgb(240, 68, 51)",
                            Border: "rgba(0, 0, 0, 0)"
                        }
                    },
                    Size: {
                        Size_0: 0,
                        Size_50: 2,
                        Size_100: 4,
                        Size_150: 6,
                        Size_200: 8,
                        Size_250: 10,
                        Size_300: 12,
                        Size_350: 14,
                        Size_400: 16,
                        Size_500: 20,
                        Size_600: 24,
                        Size_700: 28,
                        Size_800: 32,
                        Size_900: 36,
                        Size_1000: 40,
                        Size_1100: 44,
                        Size_1200: 48,
                        Size_1300: 52,
                        Size_1400: 56,
                        Size_1500: 60,
                        Size_1600: 64,
                        Size_1700: 68,
                        Size_1800: 72,
                        Size_1900: 76,
                        Size_2000: 80,
                        Size_2100: 84,
                        Size_2200: 88,
                        Size_2300: 92,
                        Size_2400: 96,
                        Size_2500: 100,
                        Size_2600: 104,
                        Size_2700: 108,
                        Size_2800: 112,
                        Size_2900: 116,
                        Size_3000: 120
                    },
                    Padding: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Margin: {
                        None: 0,
                        Small: 20,
                        Medium: 24,
                        Large: 48
                    },
                    Gap: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Gutter: {
                        None: 0,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Radius: {
                        None: 0,
                        XSmall: 2,
                        Small: 4,
                        Medium: 8,
                        Large: 16,
                        Circle: 9999
                    },
                    Stroke: {
                        None: 0,
                        Thin: .5,
                        Standard: 1,
                        Thick: 1.5,
                        Thicker: 3
                    },
                    InputSize: {
                        XSmall: 24,
                        Small: 32,
                        Medium: 40,
                        Large: 48
                    },
                    IconSize: {
                        XSmall: 12,
                        Small: 16,
                        Medium: 20,
                        Large: 24,
                        XLarge: 28
                    },
                    ToggleSize: {
                        XSmall: 16,
                        Small: 20,
                        Medium: 24,
                        Large: 28
                    },
                    LineHeight: {
                        LineHeight_100: 1,
                        LineHeight_120: 1.2,
                        LineHeight_130: 1.3,
                        LineHeight_140: 1.4
                    },
                    LetterSpacing: {
                        Tight: -.01,
                        Default: 0,
                        Loose: .01
                    },
                    FontSize: {
                        FontSize_200: 8,
                        FontSize_250: 10,
                        FontSize_300: 12,
                        FontSize_350: 14,
                        FontSize_400: 16,
                        FontSize_500: 20,
                        FontSize_600: 24,
                        FontSize_700: 28,
                        FontSize_800: 32,
                        FontSize_900: 36,
                        FontSize_1000: 40,
                        FontSize_1100: 44,
                        FontSize_1200: 48,
                        FontSize_1300: 52,
                        FontSize_1400: 56,
                        FontSize_1500: 60,
                        FontSize_1600: 64,
                        FontSize_1700: 68,
                        FontSize_1800: 72,
                        FontSize_1900: 76,
                        FontSize_2000: 80,
                        FontSize_2100: 84,
                        FontSize_2200: 88,
                        FontSize_2300: 92,
                        FontSize_2400: 96,
                        FontSize_2500: 100,
                        FontSize_2600: 104,
                        FontSize_2700: 108,
                        FontSize_2800: 112,
                        FontSize_2900: 116,
                        FontSize_3000: 120
                    },
                    FontWeight: {
                        FontWeight_300: "300",
                        FontWeight_400: "400",
                        FontWeight_500: "500",
                        FontWeight_600: "600",
                        FontWeight_700: "700",
                        FontWeight_800: "800"
                    },
                    Typography: {
                        DisplayLarge: {
                            Font: '700 80/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 80,
                            LineHeight: 1.2
                        },
                        DisplayMedium: {
                            Font: '700 56/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 56,
                            LineHeight: 1.2
                        },
                        DisplaySmall: {
                            Font: '700 40/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 40,
                            LineHeight: 1.2
                        },
                        HeadingLarge: {
                            Font: '700 28/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 28,
                            LineHeight: 1.2
                        },
                        HeadingMedium: {
                            Font: '700 24/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 24,
                            LineHeight: 1.2
                        },
                        HeadingSmall: {
                            Font: '700 20/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 20,
                            LineHeight: 1.2
                        },
                        TitleLarge: {
                            Font: '700 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        TitleMedium: {
                            Font: '700 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        TitleSmall: {
                            Font: '700 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        LabelLarge: {
                            Font: '600 16/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 16,
                            LineHeight: 1
                        },
                        LabelMedium: {
                            Font: '600 14/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1
                        },
                        LabelSmall: {
                            Font: '600 12/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1
                        },
                        BodyLarge: {
                            Font: '400 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        BodyMedium: {
                            Font: '400 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        BodySmall: {
                            Font: '400 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionLarge: {
                            Font: '600 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        CaptionMedium: {
                            Font: '600 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionSmall: {
                            Font: '600 10/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 10,
                            LineHeight: 1.4
                        }
                    },
                    Time: {
                        Time_50: .05,
                        Time_100: .1,
                        Time_200: .2,
                        Time_300: .3,
                        Time_400: .4,
                        Time_500: .5,
                        Time_600: .6,
                        Time_700: .7,
                        Time_800: .8,
                        Time_900: .9,
                        Time_1000: 1
                    },
                    Ease: {
                        StandardIn: {
                            Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                            Raw: [.8, 0, .4, 1]
                        },
                        StandardOut: {
                            Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                            Raw: [.2, 0, 0, 1]
                        },
                        ExpressiveIn: {
                            Bezier: "cubic-bezier(0.25, 0, 0.5, -1)",
                            Raw: [.25, 0, .5, -1]
                        },
                        ExpressiveOut: {
                            Bezier: "cubic-bezier(0.25, 1.5, 0.5, 1)",
                            Raw: [.25, 1.5, .5, 1]
                        },
                        Linear: {
                            Bezier: "cubic-bezier(0, 0, 1, 1)",
                            Raw: [0, 0, 1, 1]
                        }
                    }
                }
            },
            11: function(r, e) {
                "use strict";
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), e.UIBloxDark = void 0, e.UIBloxDark = {
                    Color: {
                        Extended: {
                            Black: {
                                Black_0: "rgba(0, 0, 0, 0)",
                                Black_03: "rgba(0, 0, 0, 0.03)",
                                Black_05: "rgba(0, 0, 0, 0.05)",
                                Black_10: "rgba(0, 0, 0, 0.1)",
                                Black_15: "rgba(0, 0, 0, 0.15)",
                                Black_20: "rgba(0, 0, 0, 0.2)",
                                Black_30: "rgba(0, 0, 0, 0.3)",
                                Black_40: "rgba(0, 0, 0, 0.4)",
                                Black_50: "rgba(0, 0, 0, 0.5)",
                                Black_60: "rgba(0, 0, 0, 0.6)",
                                Black_70: "rgba(0, 0, 0, 0.7)",
                                Black_80: "rgba(0, 0, 0, 0.8)",
                                Black_85: "rgba(0, 0, 0, 0.85)",
                                Black_90: "rgba(0, 0, 0, 0.9)",
                                Black_95: "rgba(0, 0, 0, 0.95)",
                                Black_97: "rgba(0, 0, 0, 0.97)",
                                Black_100: "rgb(0, 0, 0)"
                            },
                            White: {
                                White_0: "rgba(255, 255, 255, 0)",
                                White_03: "rgba(255, 255, 255, 0.03)",
                                White_05: "rgba(255, 255, 255, 0.05)",
                                White_10: "rgba(255, 255, 255, 0.1)",
                                White_15: "rgba(255, 255, 255, 0.15)",
                                White_20: "rgba(255, 255, 255, 0.2)",
                                White_30: "rgba(255, 255, 255, 0.3)",
                                White_40: "rgba(255, 255, 255, 0.4)",
                                White_50: "rgba(255, 255, 255, 0.5)",
                                White_60: "rgba(255, 255, 255, 0.6)",
                                White_70: "rgba(255, 255, 255, 0.7)",
                                White_80: "rgba(255, 255, 255, 0.8)",
                                White_85: "rgba(255, 255, 255, 0.85)",
                                White_90: "rgba(255, 255, 255, 0.9)",
                                White_95: "rgba(255, 255, 255, 0.95)",
                                White_97: "rgba(255, 255, 255, 0.97)",
                                White_100: "rgb(255, 255, 255)"
                            },
                            Red: {
                                Red_100: "rgb(255, 234, 233)",
                                Red_200: "rgb(255, 223, 222)",
                                Red_300: "rgb(247, 205, 203)",
                                Red_400: "rgb(243, 178, 174)",
                                Red_500: "rgb(238, 151, 145)",
                                Red_600: "rgb(235, 121, 115)",
                                Red_700: "rgb(231, 87, 80)",
                                Red_800: "rgb(223, 40, 31)",
                                Red_900: "rgb(197, 18, 10)",
                                Red_1000: "rgb(164, 17, 9)",
                                Red_1100: "rgb(131, 15, 7)",
                                Red_1200: "rgb(100, 12, 5)",
                                Red_1300: "rgb(71, 8, 4)",
                                Red_1400: "rgb(40, 6, 3)"
                            },
                            Orange: {
                                Orange_100: "rgb(253, 232, 216)",
                                Orange_200: "rgb(252, 222, 199)",
                                Orange_300: "rgb(251, 206, 174)",
                                Orange_400: "rgb(251, 178, 134)",
                                Orange_500: "rgb(250, 148, 90)",
                                Orange_600: "rgb(245, 118, 48)",
                                Orange_700: "rgb(220, 100, 35)",
                                Orange_800: "rgb(192, 80, 20)",
                                Orange_900: "rgb(169, 67, 11)",
                                Orange_1000: "rgb(144, 51, 0)",
                                Orange_1100: "rgb(115, 40, 0)",
                                Orange_1200: "rgb(87, 30, 0)",
                                Orange_1300: "rgb(60, 21, 0)",
                                Orange_1400: "rgb(33, 13, 1)"
                            },
                            Yellow: {
                                Yellow_100: "rgb(253, 236, 193)",
                                Yellow_200: "rgb(250, 228, 170)",
                                Yellow_300: "rgb(247, 210, 115)",
                                Yellow_400: "rgb(242, 186, 42)",
                                Yellow_500: "rgb(219, 166, 31)",
                                Yellow_600: "rgb(196, 147, 21)",
                                Yellow_700: "rgb(174, 128, 11)",
                                Yellow_800: "rgb(151, 108, 0)",
                                Yellow_900: "rgb(129, 93, 0)",
                                Yellow_1000: "rgb(107, 76, 0)",
                                Yellow_1100: "rgb(83, 61, 2)",
                                Yellow_1200: "rgb(63, 45, 1)",
                                Yellow_1300: "rgb(44, 31, 0)",
                                Yellow_1400: "rgb(24, 17, 0)"
                            },
                            Green: {
                                Green_100: "rgb(208, 251, 227)",
                                Green_200: "rgb(176, 246, 208)",
                                Green_300: "rgb(142, 233, 182)",
                                Green_400: "rgb(101, 215, 157)",
                                Green_500: "rgb(57, 197, 130)",
                                Green_600: "rgb(29, 177, 106)",
                                Green_700: "rgb(12, 155, 90)",
                                Green_800: "rgb(1, 133, 75)",
                                Green_900: "rgb(2, 114, 64)",
                                Green_1000: "rgb(1, 95, 53)",
                                Green_1100: "rgb(0, 74, 41)",
                                Green_1200: "rgb(1, 56, 31)",
                                Green_1300: "rgb(10, 38, 18)",
                                Green_1400: "rgb(0, 22, 12)"
                            },
                            Turquoise: {
                                Turquoise_100: "rgb(200, 246, 255)",
                                Turquoise_200: "rgb(163, 239, 254)",
                                Turquoise_300: "rgb(126, 229, 248)",
                                Turquoise_400: "rgb(92, 210, 232)",
                                Turquoise_500: "rgb(57, 189, 216)",
                                Turquoise_600: "rgb(22, 169, 199)",
                                Turquoise_700: "rgb(4, 148, 178)",
                                Turquoise_800: "rgb(18, 125, 152)",
                                Turquoise_900: "rgb(5, 108, 130)",
                                Turquoise_1000: "rgb(5, 90, 106)",
                                Turquoise_1100: "rgb(4, 71, 84)",
                                Turquoise_1200: "rgb(2, 53, 63)",
                                Turquoise_1300: "rgb(2, 37, 44)",
                                Turquoise_1400: "rgb(2, 20, 24)"
                            },
                            Blue: {
                                Blue_100: "rgb(235, 241, 255)",
                                Blue_200: "rgb(204, 221, 255)",
                                Blue_300: "rgb(173, 201, 255)",
                                Blue_400: "rgb(143, 180, 255)",
                                Blue_500: "rgb(112, 160, 255)",
                                Blue_600: "rgb(82, 139, 255)",
                                Blue_700: "rgb(51, 95, 255)",
                                Blue_800: "rgb(20, 70, 255)",
                                Blue_900: "rgb(0, 53, 245)",
                                Blue_1000: "rgb(0, 45, 214)",
                                Blue_1100: "rgb(0, 39, 184)",
                                Blue_1200: "rgb(0, 34, 153)",
                                Blue_1300: "rgb(0, 27, 122)",
                                Blue_1400: "rgb(0, 20, 92)"
                            },
                            Purple: {
                                Purple_100: "rgb(241, 231, 255)",
                                Purple_200: "rgb(233, 222, 251)",
                                Purple_300: "rgb(226, 206, 253)",
                                Purple_400: "rgb(212, 181, 252)",
                                Purple_500: "rgb(197, 156, 249)",
                                Purple_600: "rgb(182, 130, 247)",
                                Purple_700: "rgb(167, 102, 245)",
                                Purple_800: "rgb(147, 72, 240)",
                                Purple_900: "rgb(130, 46, 231)",
                                Purple_1000: "rgb(108, 33, 198)",
                                Purple_1100: "rgb(86, 20, 165)",
                                Purple_1200: "rgb(65, 8, 134)",
                                Purple_1300: "rgb(45, 4, 96)",
                                Purple_1400: "rgb(28, 2, 59)"
                            },
                            Magenta: {
                                Magenta_100: "rgb(253, 232, 249)",
                                Magenta_200: "rgb(253, 221, 253)",
                                Magenta_300: "rgb(245, 200, 252)",
                                Magenta_400: "rgb(239, 170, 250)",
                                Magenta_500: "rgb(232, 139, 248)",
                                Magenta_600: "rgb(223, 106, 247)",
                                Magenta_700: "rgb(213, 64, 245)",
                                Magenta_800: "rgb(192, 10, 232)",
                                Magenta_900: "rgb(165, 14, 200)",
                                Magenta_1000: "rgb(138, 12, 167)",
                                Magenta_1100: "rgb(110, 7, 133)",
                                Magenta_1200: "rgb(84, 4, 103)",
                                Magenta_1300: "rgb(60, 2, 74)",
                                Magenta_1400: "rgb(35, 4, 42)"
                            },
                            Pink: {
                                Pink_100: "rgb(255, 230, 242)",
                                Pink_200: "rgb(254, 220, 236)",
                                Pink_300: "rgb(250, 202, 224)",
                                Pink_400: "rgb(247, 173, 207)",
                                Pink_500: "rgb(243, 143, 184)",
                                Pink_600: "rgb(238, 114, 161)",
                                Pink_700: "rgb(231, 78, 144)",
                                Pink_800: "rgb(205, 55, 123)",
                                Pink_900: "rgb(180, 43, 106)",
                                Pink_1000: "rgb(153, 29, 88)",
                                Pink_1100: "rgb(99, 3, 53)",
                                Pink_1200: "rgb(99, 3, 53)",
                                Pink_1300: "rgb(70, 4, 36)",
                                Pink_1400: "rgb(43, 2, 21)"
                            },
                            Gray: {
                                Gray_100: "rgb(242, 244, 245)",
                                Gray_200: "rgb(232, 235, 236)",
                                Gray_300: "rgb(222, 225, 227)",
                                Gray_400: "rgb(199, 203, 206)",
                                Gray_500: "rgb(189, 190, 190)",
                                Gray_600: "rgb(145, 146, 147)",
                                Gray_700: "rgb(101, 102, 104)",
                                Gray_800: "rgb(96, 97, 98)",
                                Gray_900: "rgb(57, 59, 61)",
                                Gray_1000: "rgb(35, 37, 39)",
                                Gray_1100: "rgb(25, 27, 29)",
                                Gray_1200: "rgb(17, 18, 20)"
                            }
                        },
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(35, 37, 39)",
                            Surface_100: "rgb(25, 27, 29)",
                            Surface_200: "rgb(17, 18, 20)",
                            Surface_300: "rgb(57, 59, 61)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(0, 0, 0, 0.7)",
                            OverMedia_100: "rgba(17, 18, 20, 0.7)",
                            OverMedia_200: "rgba(25, 27, 29, 0.7)",
                            OverMedia_300: "rgba(57, 59, 61, 0.7)"
                        },
                        Shift: {
                            Shift_100: "rgba(17, 18, 20, 0.8)",
                            Shift_200: "rgb(101, 102, 104)",
                            Shift_300: "rgba(255, 255, 255, 0.2)",
                            Shift_400: "rgba(255, 255, 255, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(255, 255, 255)",
                            Default: "rgb(189, 190, 190)",
                            Muted: "rgba(255, 255, 255, 0.7)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(255, 255, 255, 0.2)",
                            Default: "rgba(255, 255, 255, 0.15)",
                            Muted: "rgba(255, 255, 255, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(255, 255, 255)",
                            Neutral: "rgb(189, 190, 190)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(57, 59, 61, 0.5)",
                            Scrim: "rgba(0, 0, 0, 0.5)",
                            Backdrop: "rgba(0, 0, 0, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(25, 27, 29)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(101, 102, 104)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(255, 255, 255, 0.1)",
                            Press: "rgba(0, 0, 0, 0.3)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(255, 255, 255, 0.2)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgb(255, 255, 255)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Config: {
                        Theme: {
                            Name: "UIBlox",
                            IsFoundation: "false",
                            IsUIBlox: "true"
                        },
                        ColorMode: {
                            Name: "Dark",
                            IsDark: "true",
                            IsLight: "false"
                        },
                        UI: {
                            Interval: 4,
                            Scale: 1,
                            StrokeBase: 1
                        },
                        Text: {
                            Interval: 4,
                            Scale: 1,
                            Font: '"Builder Sans"',
                            NominalScale: 1,
                            InverseScale: 1
                        }
                    },
                    DarkMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(35, 37, 39)",
                            Surface_100: "rgb(25, 27, 29)",
                            Surface_200: "rgb(17, 18, 20)",
                            Surface_300: "rgb(57, 59, 61)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(0, 0, 0, 0.7)",
                            OverMedia_100: "rgba(17, 18, 20, 0.7)",
                            OverMedia_200: "rgba(25, 27, 29, 0.7)",
                            OverMedia_300: "rgba(57, 59, 61, 0.7)"
                        },
                        Shift: {
                            Shift_100: "rgba(17, 18, 20, 0.8)",
                            Shift_200: "rgb(101, 102, 104)",
                            Shift_300: "rgba(255, 255, 255, 0.2)",
                            Shift_400: "rgba(255, 255, 255, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(255, 255, 255)",
                            Default: "rgb(189, 190, 190)",
                            Muted: "rgba(255, 255, 255, 0.7)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(255, 255, 255, 0.2)",
                            Default: "rgba(255, 255, 255, 0.15)",
                            Muted: "rgba(255, 255, 255, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(255, 255, 255)",
                            Neutral: "rgb(189, 190, 190)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(57, 59, 61, 0.5)",
                            Scrim: "rgba(0, 0, 0, 0.5)",
                            Backdrop: "rgba(0, 0, 0, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(25, 27, 29)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(101, 102, 104)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(255, 255, 255, 0.1)",
                            Press: "rgba(0, 0, 0, 0.3)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(255, 255, 255, 0.2)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgb(255, 255, 255)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    LightMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(242, 244, 245)",
                            Surface_100: "rgb(222, 225, 227)",
                            Surface_200: "rgb(199, 203, 206)",
                            Surface_300: "rgb(255, 255, 255)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.9)",
                            OverMedia_100: "rgba(222, 225, 227, 0.9)",
                            OverMedia_200: "rgba(255, 255, 255, 0.9)",
                            OverMedia_300: "rgba(222, 225, 227, 0.9)"
                        },
                        Shift: {
                            Shift_100: "rgba(0, 0, 0, 0.1)",
                            Shift_200: "rgb(189, 190, 190)",
                            Shift_300: "rgba(0, 0, 0, 0.2)",
                            Shift_400: "rgba(0, 0, 0, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(57, 59, 61)",
                            Default: "rgb(96, 97, 98)",
                            Muted: "rgba(0, 0, 0, 0.6)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(57, 59, 61, 0.2)",
                            Default: "rgba(57, 59, 61, 0.15)",
                            Muted: "rgba(57, 59, 61, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(57, 59, 61)",
                            Neutral: "rgb(96, 97, 98)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(0, 0, 0, 0.1)",
                            Scrim: "rgba(0, 0, 0, 0.3)",
                            Shadow: "rgba(0, 0, 0, 0.3)",
                            Backdrop: "rgba(0, 0, 0, 0.3)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(0, 0, 0, 0.1)"
                        },
                        Selection: {
                            Start: "rgb(189, 190, 190)",
                            End: "rgb(189, 190, 190)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(0, 0, 0, 0.1)",
                            Press: "rgba(0, 0, 0, 0.2)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(0, 0, 0, 0.2)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgb(96, 97, 98)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Inverse: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(242, 244, 245)",
                            Surface_100: "rgb(222, 225, 227)",
                            Surface_200: "rgb(199, 203, 206)",
                            Surface_300: "rgb(255, 255, 255)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.9)",
                            OverMedia_100: "rgba(222, 225, 227, 0.9)",
                            OverMedia_200: "rgba(255, 255, 255, 0.9)",
                            OverMedia_300: "rgba(222, 225, 227, 0.9)"
                        },
                        Shift: {
                            Shift_100: "rgba(0, 0, 0, 0.1)",
                            Shift_200: "rgb(189, 190, 190)",
                            Shift_300: "rgba(0, 0, 0, 0.2)",
                            Shift_400: "rgba(0, 0, 0, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(57, 59, 61)",
                            Default: "rgb(96, 97, 98)",
                            Muted: "rgba(0, 0, 0, 0.6)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(57, 59, 61, 0.2)",
                            Default: "rgba(57, 59, 61, 0.15)",
                            Muted: "rgba(57, 59, 61, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(57, 59, 61)",
                            Neutral: "rgb(96, 97, 98)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(0, 0, 0, 0.1)",
                            Scrim: "rgba(0, 0, 0, 0.3)",
                            Backdrop: "rgba(0, 0, 0, 0.3)",
                            Shadow: "rgba(0, 0, 0, 0.3)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(0, 0, 0, 0.1)"
                        },
                        Selection: {
                            Start: "rgb(189, 190, 190)",
                            End: "rgb(189, 190, 190)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(0, 0, 0, 0.1)",
                            Press: "rgba(0, 0, 0, 0.2)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(0, 0, 0, 0.2)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgb(96, 97, 98)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Size: {
                        Size_0: 0,
                        Size_50: 2,
                        Size_100: 4,
                        Size_150: 6,
                        Size_200: 8,
                        Size_250: 10,
                        Size_300: 12,
                        Size_350: 14,
                        Size_400: 16,
                        Size_500: 20,
                        Size_600: 24,
                        Size_700: 28,
                        Size_800: 32,
                        Size_900: 36,
                        Size_1000: 40,
                        Size_1100: 44,
                        Size_1200: 48,
                        Size_1300: 52,
                        Size_1400: 56,
                        Size_1500: 60,
                        Size_1600: 64,
                        Size_1700: 68,
                        Size_1800: 72,
                        Size_1900: 76,
                        Size_2000: 80,
                        Size_2100: 84,
                        Size_2200: 88,
                        Size_2300: 92,
                        Size_2400: 96,
                        Size_2500: 100,
                        Size_2600: 104,
                        Size_2700: 108,
                        Size_2800: 112,
                        Size_2900: 116,
                        Size_3000: 120
                    },
                    Padding: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Margin: {
                        None: 0,
                        Small: 20,
                        Medium: 24,
                        Large: 48
                    },
                    Gap: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Gutter: {
                        None: 0,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Radius: {
                        None: 0,
                        XSmall: 2,
                        Small: 4,
                        Medium: 8,
                        Large: 16,
                        Circle: 9999
                    },
                    Stroke: {
                        None: 0,
                        Thin: .5,
                        Standard: 1,
                        Thick: 1.5,
                        Thicker: 3
                    },
                    InputSize: {
                        XSmall: 24,
                        Small: 32,
                        Medium: 40,
                        Large: 48
                    },
                    IconSize: {
                        XSmall: 12,
                        Small: 16,
                        Medium: 20,
                        Large: 24,
                        XLarge: 28
                    },
                    ToggleSize: {
                        XSmall: 16,
                        Small: 20,
                        Medium: 24,
                        Large: 28
                    },
                    LineHeight: {
                        LineHeight_100: 1,
                        LineHeight_120: 1.2,
                        LineHeight_130: 1.3,
                        LineHeight_140: 1.4
                    },
                    LetterSpacing: {
                        Tight: -.01,
                        Default: 0,
                        Loose: .01
                    },
                    FontSize: {
                        FontSize_200: 8,
                        FontSize_250: 10,
                        FontSize_300: 12,
                        FontSize_350: 14,
                        FontSize_400: 16,
                        FontSize_500: 20,
                        FontSize_600: 24,
                        FontSize_700: 28,
                        FontSize_800: 32,
                        FontSize_900: 36,
                        FontSize_1000: 40,
                        FontSize_1100: 44,
                        FontSize_1200: 48,
                        FontSize_1300: 52,
                        FontSize_1400: 56,
                        FontSize_1500: 60,
                        FontSize_1600: 64,
                        FontSize_1700: 68,
                        FontSize_1800: 72,
                        FontSize_1900: 76,
                        FontSize_2000: 80,
                        FontSize_2100: 84,
                        FontSize_2200: 88,
                        FontSize_2300: 92,
                        FontSize_2400: 96,
                        FontSize_2500: 100,
                        FontSize_2600: 104,
                        FontSize_2700: 108,
                        FontSize_2800: 112,
                        FontSize_2900: 116,
                        FontSize_3000: 120
                    },
                    FontWeight: {
                        FontWeight_300: "300",
                        FontWeight_400: "400",
                        FontWeight_500: "500",
                        FontWeight_600: "600",
                        FontWeight_700: "700",
                        FontWeight_800: "800"
                    },
                    Typography: {
                        DisplayLarge: {
                            Font: '700 80/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 80,
                            LineHeight: 1.2
                        },
                        DisplayMedium: {
                            Font: '700 56/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 56,
                            LineHeight: 1.2
                        },
                        DisplaySmall: {
                            Font: '700 40/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 40,
                            LineHeight: 1.2
                        },
                        HeadingLarge: {
                            Font: '700 28/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 28,
                            LineHeight: 1.2
                        },
                        HeadingMedium: {
                            Font: '700 24/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 24,
                            LineHeight: 1.2
                        },
                        HeadingSmall: {
                            Font: '700 20/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 20,
                            LineHeight: 1.2
                        },
                        TitleLarge: {
                            Font: '700 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        TitleMedium: {
                            Font: '700 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        TitleSmall: {
                            Font: '700 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        LabelLarge: {
                            Font: '600 16/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 16,
                            LineHeight: 1
                        },
                        LabelMedium: {
                            Font: '600 14/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1
                        },
                        LabelSmall: {
                            Font: '600 12/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1
                        },
                        BodyLarge: {
                            Font: '400 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        BodyMedium: {
                            Font: '400 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        BodySmall: {
                            Font: '400 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionLarge: {
                            Font: '600 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        CaptionMedium: {
                            Font: '600 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionSmall: {
                            Font: '600 10/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 10,
                            LineHeight: 1.4
                        }
                    },
                    Time: {
                        Time_50: .05,
                        Time_100: .1,
                        Time_200: .2,
                        Time_300: .3,
                        Time_400: .4,
                        Time_500: .5,
                        Time_600: .6,
                        Time_700: .7,
                        Time_800: .8,
                        Time_900: .9,
                        Time_1000: 1
                    },
                    Ease: {
                        StandardIn: {
                            Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                            Raw: [.8, 0, .4, 1]
                        },
                        StandardOut: {
                            Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                            Raw: [.2, 0, 0, 1]
                        },
                        ExpressiveIn: {
                            Bezier: "cubic-bezier(0.25, 0, 0.5, -1)",
                            Raw: [.25, 0, .5, -1]
                        },
                        ExpressiveOut: {
                            Bezier: "cubic-bezier(0.25, 1.5, 0.5, 1)",
                            Raw: [.25, 1.5, .5, 1]
                        },
                        Linear: {
                            Bezier: "cubic-bezier(0, 0, 1, 1)",
                            Raw: [0, 0, 1, 1]
                        }
                    }
                }
            },
            211: function(r, e) {
                "use strict";
                Object.defineProperty(e, "__esModule", {
                    value: !0
                }), e.UIBloxLight = void 0, e.UIBloxLight = {
                    Color: {
                        Extended: {
                            Black: {
                                Black_0: "rgba(0, 0, 0, 0)",
                                Black_03: "rgba(0, 0, 0, 0.03)",
                                Black_05: "rgba(0, 0, 0, 0.05)",
                                Black_10: "rgba(0, 0, 0, 0.1)",
                                Black_15: "rgba(0, 0, 0, 0.15)",
                                Black_20: "rgba(0, 0, 0, 0.2)",
                                Black_30: "rgba(0, 0, 0, 0.3)",
                                Black_40: "rgba(0, 0, 0, 0.4)",
                                Black_50: "rgba(0, 0, 0, 0.5)",
                                Black_60: "rgba(0, 0, 0, 0.6)",
                                Black_70: "rgba(0, 0, 0, 0.7)",
                                Black_80: "rgba(0, 0, 0, 0.8)",
                                Black_85: "rgba(0, 0, 0, 0.85)",
                                Black_90: "rgba(0, 0, 0, 0.9)",
                                Black_95: "rgba(0, 0, 0, 0.95)",
                                Black_97: "rgba(0, 0, 0, 0.97)",
                                Black_100: "rgb(0, 0, 0)"
                            },
                            White: {
                                White_0: "rgba(255, 255, 255, 0)",
                                White_03: "rgba(255, 255, 255, 0.03)",
                                White_05: "rgba(255, 255, 255, 0.05)",
                                White_10: "rgba(255, 255, 255, 0.1)",
                                White_15: "rgba(255, 255, 255, 0.15)",
                                White_20: "rgba(255, 255, 255, 0.2)",
                                White_30: "rgba(255, 255, 255, 0.3)",
                                White_40: "rgba(255, 255, 255, 0.4)",
                                White_50: "rgba(255, 255, 255, 0.5)",
                                White_60: "rgba(255, 255, 255, 0.6)",
                                White_70: "rgba(255, 255, 255, 0.7)",
                                White_80: "rgba(255, 255, 255, 0.8)",
                                White_85: "rgba(255, 255, 255, 0.85)",
                                White_90: "rgba(255, 255, 255, 0.9)",
                                White_95: "rgba(255, 255, 255, 0.95)",
                                White_97: "rgba(255, 255, 255, 0.97)",
                                White_100: "rgb(255, 255, 255)"
                            },
                            Red: {
                                Red_100: "rgb(255, 234, 233)",
                                Red_200: "rgb(255, 223, 222)",
                                Red_300: "rgb(247, 205, 203)",
                                Red_400: "rgb(243, 178, 174)",
                                Red_500: "rgb(238, 151, 145)",
                                Red_600: "rgb(235, 121, 115)",
                                Red_700: "rgb(231, 87, 80)",
                                Red_800: "rgb(223, 40, 31)",
                                Red_900: "rgb(197, 18, 10)",
                                Red_1000: "rgb(164, 17, 9)",
                                Red_1100: "rgb(131, 15, 7)",
                                Red_1200: "rgb(100, 12, 5)",
                                Red_1300: "rgb(71, 8, 4)",
                                Red_1400: "rgb(40, 6, 3)"
                            },
                            Orange: {
                                Orange_100: "rgb(253, 232, 216)",
                                Orange_200: "rgb(252, 222, 199)",
                                Orange_300: "rgb(251, 206, 174)",
                                Orange_400: "rgb(251, 178, 134)",
                                Orange_500: "rgb(250, 148, 90)",
                                Orange_600: "rgb(245, 118, 48)",
                                Orange_700: "rgb(220, 100, 35)",
                                Orange_800: "rgb(192, 80, 20)",
                                Orange_900: "rgb(169, 67, 11)",
                                Orange_1000: "rgb(144, 51, 0)",
                                Orange_1100: "rgb(115, 40, 0)",
                                Orange_1200: "rgb(87, 30, 0)",
                                Orange_1300: "rgb(60, 21, 0)",
                                Orange_1400: "rgb(33, 13, 1)"
                            },
                            Yellow: {
                                Yellow_100: "rgb(253, 236, 193)",
                                Yellow_200: "rgb(250, 228, 170)",
                                Yellow_300: "rgb(247, 210, 115)",
                                Yellow_400: "rgb(242, 186, 42)",
                                Yellow_500: "rgb(219, 166, 31)",
                                Yellow_600: "rgb(196, 147, 21)",
                                Yellow_700: "rgb(174, 128, 11)",
                                Yellow_800: "rgb(151, 108, 0)",
                                Yellow_900: "rgb(129, 93, 0)",
                                Yellow_1000: "rgb(107, 76, 0)",
                                Yellow_1100: "rgb(83, 61, 2)",
                                Yellow_1200: "rgb(63, 45, 1)",
                                Yellow_1300: "rgb(44, 31, 0)",
                                Yellow_1400: "rgb(24, 17, 0)"
                            },
                            Green: {
                                Green_100: "rgb(208, 251, 227)",
                                Green_200: "rgb(176, 246, 208)",
                                Green_300: "rgb(142, 233, 182)",
                                Green_400: "rgb(101, 215, 157)",
                                Green_500: "rgb(57, 197, 130)",
                                Green_600: "rgb(29, 177, 106)",
                                Green_700: "rgb(12, 155, 90)",
                                Green_800: "rgb(1, 133, 75)",
                                Green_900: "rgb(2, 114, 64)",
                                Green_1000: "rgb(1, 95, 53)",
                                Green_1100: "rgb(0, 74, 41)",
                                Green_1200: "rgb(1, 56, 31)",
                                Green_1300: "rgb(10, 38, 18)",
                                Green_1400: "rgb(0, 22, 12)"
                            },
                            Turquoise: {
                                Turquoise_100: "rgb(200, 246, 255)",
                                Turquoise_200: "rgb(163, 239, 254)",
                                Turquoise_300: "rgb(126, 229, 248)",
                                Turquoise_400: "rgb(92, 210, 232)",
                                Turquoise_500: "rgb(57, 189, 216)",
                                Turquoise_600: "rgb(22, 169, 199)",
                                Turquoise_700: "rgb(4, 148, 178)",
                                Turquoise_800: "rgb(18, 125, 152)",
                                Turquoise_900: "rgb(5, 108, 130)",
                                Turquoise_1000: "rgb(5, 90, 106)",
                                Turquoise_1100: "rgb(4, 71, 84)",
                                Turquoise_1200: "rgb(2, 53, 63)",
                                Turquoise_1300: "rgb(2, 37, 44)",
                                Turquoise_1400: "rgb(2, 20, 24)"
                            },
                            Blue: {
                                Blue_100: "rgb(235, 241, 255)",
                                Blue_200: "rgb(204, 221, 255)",
                                Blue_300: "rgb(173, 201, 255)",
                                Blue_400: "rgb(143, 180, 255)",
                                Blue_500: "rgb(112, 160, 255)",
                                Blue_600: "rgb(82, 139, 255)",
                                Blue_700: "rgb(51, 95, 255)",
                                Blue_800: "rgb(20, 70, 255)",
                                Blue_900: "rgb(0, 53, 245)",
                                Blue_1000: "rgb(0, 45, 214)",
                                Blue_1100: "rgb(0, 39, 184)",
                                Blue_1200: "rgb(0, 34, 153)",
                                Blue_1300: "rgb(0, 27, 122)",
                                Blue_1400: "rgb(0, 20, 92)"
                            },
                            Purple: {
                                Purple_100: "rgb(241, 231, 255)",
                                Purple_200: "rgb(233, 222, 251)",
                                Purple_300: "rgb(226, 206, 253)",
                                Purple_400: "rgb(212, 181, 252)",
                                Purple_500: "rgb(197, 156, 249)",
                                Purple_600: "rgb(182, 130, 247)",
                                Purple_700: "rgb(167, 102, 245)",
                                Purple_800: "rgb(147, 72, 240)",
                                Purple_900: "rgb(130, 46, 231)",
                                Purple_1000: "rgb(108, 33, 198)",
                                Purple_1100: "rgb(86, 20, 165)",
                                Purple_1200: "rgb(65, 8, 134)",
                                Purple_1300: "rgb(45, 4, 96)",
                                Purple_1400: "rgb(28, 2, 59)"
                            },
                            Magenta: {
                                Magenta_100: "rgb(253, 232, 249)",
                                Magenta_200: "rgb(253, 221, 253)",
                                Magenta_300: "rgb(245, 200, 252)",
                                Magenta_400: "rgb(239, 170, 250)",
                                Magenta_500: "rgb(232, 139, 248)",
                                Magenta_600: "rgb(223, 106, 247)",
                                Magenta_700: "rgb(213, 64, 245)",
                                Magenta_800: "rgb(192, 10, 232)",
                                Magenta_900: "rgb(165, 14, 200)",
                                Magenta_1000: "rgb(138, 12, 167)",
                                Magenta_1100: "rgb(110, 7, 133)",
                                Magenta_1200: "rgb(84, 4, 103)",
                                Magenta_1300: "rgb(60, 2, 74)",
                                Magenta_1400: "rgb(35, 4, 42)"
                            },
                            Pink: {
                                Pink_100: "rgb(255, 230, 242)",
                                Pink_200: "rgb(254, 220, 236)",
                                Pink_300: "rgb(250, 202, 224)",
                                Pink_400: "rgb(247, 173, 207)",
                                Pink_500: "rgb(243, 143, 184)",
                                Pink_600: "rgb(238, 114, 161)",
                                Pink_700: "rgb(231, 78, 144)",
                                Pink_800: "rgb(205, 55, 123)",
                                Pink_900: "rgb(180, 43, 106)",
                                Pink_1000: "rgb(153, 29, 88)",
                                Pink_1100: "rgb(99, 3, 53)",
                                Pink_1200: "rgb(99, 3, 53)",
                                Pink_1300: "rgb(70, 4, 36)",
                                Pink_1400: "rgb(43, 2, 21)"
                            },
                            Gray: {
                                Gray_100: "rgb(242, 244, 245)",
                                Gray_200: "rgb(232, 235, 236)",
                                Gray_300: "rgb(222, 225, 227)",
                                Gray_400: "rgb(199, 203, 206)",
                                Gray_500: "rgb(189, 190, 190)",
                                Gray_600: "rgb(145, 146, 147)",
                                Gray_700: "rgb(101, 102, 104)",
                                Gray_800: "rgb(96, 97, 98)",
                                Gray_900: "rgb(57, 59, 61)",
                                Gray_1000: "rgb(35, 37, 39)",
                                Gray_1100: "rgb(25, 27, 29)",
                                Gray_1200: "rgb(17, 18, 20)"
                            }
                        },
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(242, 244, 245)",
                            Surface_100: "rgb(222, 225, 227)",
                            Surface_200: "rgb(199, 203, 206)",
                            Surface_300: "rgb(255, 255, 255)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.9)",
                            OverMedia_100: "rgba(222, 225, 227, 0.9)",
                            OverMedia_200: "rgba(255, 255, 255, 0.9)",
                            OverMedia_300: "rgba(222, 225, 227, 0.9)"
                        },
                        Shift: {
                            Shift_100: "rgba(0, 0, 0, 0.1)",
                            Shift_200: "rgb(189, 190, 190)",
                            Shift_300: "rgba(0, 0, 0, 0.2)",
                            Shift_400: "rgba(0, 0, 0, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(57, 59, 61)",
                            Default: "rgb(96, 97, 98)",
                            Muted: "rgba(0, 0, 0, 0.6)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(57, 59, 61, 0.2)",
                            Default: "rgba(57, 59, 61, 0.15)",
                            Muted: "rgba(57, 59, 61, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(57, 59, 61)",
                            Neutral: "rgb(96, 97, 98)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(0, 0, 0, 0.1)",
                            Scrim: "rgba(0, 0, 0, 0.3)",
                            Backdrop: "rgba(0, 0, 0, 0.3)",
                            Shadow: "rgba(0, 0, 0, 0.3)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(0, 0, 0, 0.1)"
                        },
                        Selection: {
                            Start: "rgb(189, 190, 190)",
                            End: "rgb(189, 190, 190)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(0, 0, 0, 0.1)",
                            Press: "rgba(0, 0, 0, 0.2)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(0, 0, 0, 0.2)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgb(96, 97, 98)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Config: {
                        Theme: {
                            Name: "UIBlox",
                            IsFoundation: "false",
                            IsUIBlox: "true"
                        },
                        ColorMode: {
                            Name: "Light",
                            IsDark: "false",
                            IsLight: "true"
                        },
                        UI: {
                            Interval: 4,
                            Scale: 1,
                            StrokeBase: 1
                        },
                        Text: {
                            Interval: 4,
                            Scale: 1,
                            Font: '"Builder Sans"',
                            NominalScale: 1,
                            InverseScale: 1
                        }
                    },
                    DarkMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(35, 37, 39)",
                            Surface_100: "rgb(25, 27, 29)",
                            Surface_200: "rgb(17, 18, 20)",
                            Surface_300: "rgb(57, 59, 61)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(0, 0, 0, 0.7)",
                            OverMedia_100: "rgba(17, 18, 20, 0.7)",
                            OverMedia_200: "rgba(25, 27, 29, 0.7)",
                            OverMedia_300: "rgba(57, 59, 61, 0.7)"
                        },
                        Shift: {
                            Shift_100: "rgba(17, 18, 20, 0.8)",
                            Shift_200: "rgb(101, 102, 104)",
                            Shift_300: "rgba(255, 255, 255, 0.2)",
                            Shift_400: "rgba(255, 255, 255, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(255, 255, 255)",
                            Default: "rgb(189, 190, 190)",
                            Muted: "rgba(255, 255, 255, 0.7)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(255, 255, 255, 0.2)",
                            Default: "rgba(255, 255, 255, 0.15)",
                            Muted: "rgba(255, 255, 255, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(255, 255, 255)",
                            Neutral: "rgb(189, 190, 190)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(57, 59, 61, 0.5)",
                            Scrim: "rgba(0, 0, 0, 0.5)",
                            Backdrop: "rgba(0, 0, 0, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(25, 27, 29)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(101, 102, 104)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(255, 255, 255, 0.1)",
                            Press: "rgba(0, 0, 0, 0.3)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(255, 255, 255, 0.2)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgb(255, 255, 255)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    LightMode: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(242, 244, 245)",
                            Surface_100: "rgb(222, 225, 227)",
                            Surface_200: "rgb(199, 203, 206)",
                            Surface_300: "rgb(255, 255, 255)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(255, 255, 255, 0.9)",
                            OverMedia_100: "rgba(222, 225, 227, 0.9)",
                            OverMedia_200: "rgba(255, 255, 255, 0.9)",
                            OverMedia_300: "rgba(222, 225, 227, 0.9)"
                        },
                        Shift: {
                            Shift_100: "rgba(0, 0, 0, 0.1)",
                            Shift_200: "rgb(189, 190, 190)",
                            Shift_300: "rgba(0, 0, 0, 0.2)",
                            Shift_400: "rgba(0, 0, 0, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(57, 59, 61)",
                            Default: "rgb(96, 97, 98)",
                            Muted: "rgba(0, 0, 0, 0.6)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(57, 59, 61, 0.2)",
                            Default: "rgba(57, 59, 61, 0.15)",
                            Muted: "rgba(57, 59, 61, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(57, 59, 61)",
                            Neutral: "rgb(96, 97, 98)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(0, 0, 0, 0.1)",
                            Scrim: "rgba(0, 0, 0, 0.3)",
                            Shadow: "rgba(0, 0, 0, 0.3)",
                            Backdrop: "rgba(0, 0, 0, 0.3)",
                            NavigationBar: "rgb(255, 255, 255)",
                            HeavyDivider: "rgba(0, 0, 0, 0.1)"
                        },
                        Selection: {
                            Start: "rgb(189, 190, 190)",
                            End: "rgb(189, 190, 190)"
                        },
                        State: {
                            Idle: "rgba(0, 0, 0, 0)",
                            Hover: "rgba(0, 0, 0, 0.1)",
                            Press: "rgba(0, 0, 0, 0.2)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(57, 59, 61)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(0, 0, 0, 0.2)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgb(96, 97, 98)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Inverse: {
                        None: "rgba(0, 0, 0, 0)",
                        Surface: {
                            Surface_0: "rgb(35, 37, 39)",
                            Surface_100: "rgb(25, 27, 29)",
                            Surface_200: "rgb(17, 18, 20)",
                            Surface_300: "rgb(57, 59, 61)"
                        },
                        OverMedia: {
                            OverMedia_0: "rgba(0, 0, 0, 0.7)",
                            OverMedia_100: "rgba(17, 18, 20, 0.7)",
                            OverMedia_200: "rgba(25, 27, 29, 0.7)",
                            OverMedia_300: "rgba(57, 59, 61, 0.7)"
                        },
                        Shift: {
                            Shift_100: "rgba(17, 18, 20, 0.8)",
                            Shift_200: "rgb(101, 102, 104)",
                            Shift_300: "rgba(255, 255, 255, 0.2)",
                            Shift_400: "rgba(255, 255, 255, 0.3)"
                        },
                        Content: {
                            Emphasis: "rgb(255, 255, 255)",
                            Default: "rgb(189, 190, 190)",
                            Muted: "rgba(255, 255, 255, 0.7)",
                            Link: "rgb(112, 160, 255)"
                        },
                        Stroke: {
                            Emphasis: "rgba(255, 255, 255, 0.2)",
                            Default: "rgba(255, 255, 255, 0.15)",
                            Muted: "rgba(255, 255, 255, 0.1)"
                        },
                        System: {
                            Contrast: "rgb(255, 255, 255)",
                            Neutral: "rgb(189, 190, 190)",
                            Emphasis: "rgb(0, 180, 109)",
                            Success: "rgb(0, 180, 109)",
                            Warning: "rgb(242, 186, 42)",
                            Alert: "rgb(247, 75, 82)"
                        },
                        Common: {
                            Shimmer: "rgba(57, 59, 61, 0.5)",
                            Scrim: "rgba(0, 0, 0, 0.5)",
                            Backdrop: "rgba(0, 0, 0, 0.5)",
                            Shadow: "rgba(0, 0, 0, 0.5)",
                            NavigationBar: "rgb(25, 27, 29)",
                            HeavyDivider: "rgba(0, 0, 0, 0.5)"
                        },
                        Selection: {
                            Start: "rgb(255, 255, 255)",
                            End: "rgb(101, 102, 104)"
                        },
                        State: {
                            Idle: "rgba(255, 255, 255, 0)",
                            Hover: "rgba(255, 255, 255, 0.1)",
                            Press: "rgba(0, 0, 0, 0.3)"
                        },
                        ActionEmphasis: {
                            Background: "rgb(0, 180, 109)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSoftEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubEmphasis: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionOverMedia: {
                            Background: "rgb(255, 255, 255)",
                            Foreground: "rgb(57, 59, 61)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionStandard: {
                            Background: "rgba(255, 255, 255, 0.2)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionSubtle: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgb(255, 255, 255)"
                        },
                        ActionLink: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionUtility: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(255, 255, 255)",
                            Border: "rgba(0, 0, 0, 0)"
                        },
                        ActionAlert: {
                            Background: "rgba(0, 0, 0, 0)",
                            Foreground: "rgb(247, 75, 82)",
                            Border: "rgb(247, 75, 82)"
                        }
                    },
                    Size: {
                        Size_0: 0,
                        Size_50: 2,
                        Size_100: 4,
                        Size_150: 6,
                        Size_200: 8,
                        Size_250: 10,
                        Size_300: 12,
                        Size_350: 14,
                        Size_400: 16,
                        Size_500: 20,
                        Size_600: 24,
                        Size_700: 28,
                        Size_800: 32,
                        Size_900: 36,
                        Size_1000: 40,
                        Size_1100: 44,
                        Size_1200: 48,
                        Size_1300: 52,
                        Size_1400: 56,
                        Size_1500: 60,
                        Size_1600: 64,
                        Size_1700: 68,
                        Size_1800: 72,
                        Size_1900: 76,
                        Size_2000: 80,
                        Size_2100: 84,
                        Size_2200: 88,
                        Size_2300: 92,
                        Size_2400: 96,
                        Size_2500: 100,
                        Size_2600: 104,
                        Size_2700: 108,
                        Size_2800: 112,
                        Size_2900: 116,
                        Size_3000: 120
                    },
                    Padding: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Margin: {
                        None: 0,
                        Small: 20,
                        Medium: 24,
                        Large: 48
                    },
                    Gap: {
                        None: 0,
                        XXSmall: 2,
                        XSmall: 4,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Gutter: {
                        None: 0,
                        Small: 8,
                        Medium: 12,
                        Large: 16,
                        XLarge: 20,
                        XXLarge: 24
                    },
                    Radius: {
                        None: 0,
                        XSmall: 2,
                        Small: 4,
                        Medium: 8,
                        Large: 16,
                        Circle: 9999
                    },
                    Stroke: {
                        None: 0,
                        Thin: .5,
                        Standard: 1,
                        Thick: 1.5,
                        Thicker: 3
                    },
                    InputSize: {
                        XSmall: 24,
                        Small: 32,
                        Medium: 40,
                        Large: 48
                    },
                    IconSize: {
                        XSmall: 12,
                        Small: 16,
                        Medium: 20,
                        Large: 24,
                        XLarge: 28
                    },
                    ToggleSize: {
                        XSmall: 16,
                        Small: 20,
                        Medium: 24,
                        Large: 28
                    },
                    LineHeight: {
                        LineHeight_100: 1,
                        LineHeight_120: 1.2,
                        LineHeight_130: 1.3,
                        LineHeight_140: 1.4
                    },
                    LetterSpacing: {
                        Tight: -.01,
                        Default: 0,
                        Loose: .01
                    },
                    FontSize: {
                        FontSize_200: 8,
                        FontSize_250: 10,
                        FontSize_300: 12,
                        FontSize_350: 14,
                        FontSize_400: 16,
                        FontSize_500: 20,
                        FontSize_600: 24,
                        FontSize_700: 28,
                        FontSize_800: 32,
                        FontSize_900: 36,
                        FontSize_1000: 40,
                        FontSize_1100: 44,
                        FontSize_1200: 48,
                        FontSize_1300: 52,
                        FontSize_1400: 56,
                        FontSize_1500: 60,
                        FontSize_1600: 64,
                        FontSize_1700: 68,
                        FontSize_1800: 72,
                        FontSize_1900: 76,
                        FontSize_2000: 80,
                        FontSize_2100: 84,
                        FontSize_2200: 88,
                        FontSize_2300: 92,
                        FontSize_2400: 96,
                        FontSize_2500: 100,
                        FontSize_2600: 104,
                        FontSize_2700: 108,
                        FontSize_2800: 112,
                        FontSize_2900: 116,
                        FontSize_3000: 120
                    },
                    FontWeight: {
                        FontWeight_300: "300",
                        FontWeight_400: "400",
                        FontWeight_500: "500",
                        FontWeight_600: "600",
                        FontWeight_700: "700",
                        FontWeight_800: "800"
                    },
                    Typography: {
                        DisplayLarge: {
                            Font: '700 80/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 80,
                            LineHeight: 1.2
                        },
                        DisplayMedium: {
                            Font: '700 56/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 56,
                            LineHeight: 1.2
                        },
                        DisplaySmall: {
                            Font: '700 40/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 40,
                            LineHeight: 1.2
                        },
                        HeadingLarge: {
                            Font: '700 28/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 28,
                            LineHeight: 1.2
                        },
                        HeadingMedium: {
                            Font: '700 24/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 24,
                            LineHeight: 1.2
                        },
                        HeadingSmall: {
                            Font: '700 20/1.2 "Builder Sans"',
                            LetterSpacing: -.01,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 20,
                            LineHeight: 1.2
                        },
                        TitleLarge: {
                            Font: '700 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        TitleMedium: {
                            Font: '700 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        TitleSmall: {
                            Font: '700 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "700",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        LabelLarge: {
                            Font: '600 16/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 16,
                            LineHeight: 1
                        },
                        LabelMedium: {
                            Font: '600 14/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1
                        },
                        LabelSmall: {
                            Font: '600 12/1 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1
                        },
                        BodyLarge: {
                            Font: '400 16/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 16,
                            LineHeight: 1.4
                        },
                        BodyMedium: {
                            Font: '400 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        BodySmall: {
                            Font: '400 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "400",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionLarge: {
                            Font: '600 14/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 14,
                            LineHeight: 1.4
                        },
                        CaptionMedium: {
                            Font: '600 12/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 12,
                            LineHeight: 1.4
                        },
                        CaptionSmall: {
                            Font: '600 10/1.4 "Builder Sans"',
                            LetterSpacing: 0,
                            FontFamily: '"Builder Sans"',
                            FontWeight: "600",
                            FontSize: 10,
                            LineHeight: 1.4
                        }
                    },
                    Time: {
                        Time_50: .05,
                        Time_100: .1,
                        Time_200: .2,
                        Time_300: .3,
                        Time_400: .4,
                        Time_500: .5,
                        Time_600: .6,
                        Time_700: .7,
                        Time_800: .8,
                        Time_900: .9,
                        Time_1000: 1
                    },
                    Ease: {
                        StandardIn: {
                            Bezier: "cubic-bezier(0.8, 0, 0.4, 1)",
                            Raw: [.8, 0, .4, 1]
                        },
                        StandardOut: {
                            Bezier: "cubic-bezier(0.2, 0, 0, 1)",
                            Raw: [.2, 0, 0, 1]
                        },
                        ExpressiveIn: {
                            Bezier: "cubic-bezier(0.25, 0, 0.5, -1)",
                            Raw: [.25, 0, .5, -1]
                        },
                        ExpressiveOut: {
                            Bezier: "cubic-bezier(0.25, 1.5, 0.5, 1)",
                            Raw: [.25, 1.5, .5, 1]
                        },
                        Linear: {
                            Bezier: "cubic-bezier(0, 0, 1, 1)",
                            Raw: [0, 0, 1, 1]
                        }
                    }
                }
            },
            942: function(r) {
                function e(r) {
                    return r && "undefined" != typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var t = {}.hasOwnProperty;

                    function n() {
                        for (var r = "", o = 0; o < arguments.length; o++) {
                            var i = arguments[o];
                            i && (r = a(r, function(r) {
                                if ("string" == typeof r || "number" == typeof r) return r;
                                if ((void 0 === r ? "undefined" : e(r)) !== "object") return "";
                                if (Array.isArray(r)) return n.apply(null, r);
                                if (r.toString !== Object.prototype.toString && !r.toString.toString().includes("[native code]")) return r.toString();
                                var o = "";
                                for (var i in r) t.call(r, i) && r[i] && (o = a(o, i));
                                return o
                            }(i)))
                        }
                        return r
                    }

                    function a(r, e) {
                        return e ? r ? r + " " + e : r + e : r
                    }
                    r.exports ? (n.default = n, r.exports = n) : "function" == typeof define && "object" === e(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            }
        },
        e = {};

    function t(n) {
        var a = e[n];
        if (void 0 !== a) return a.exports;
        var o = e[n] = {
            exports: {}
        };
        return r[n].call(o.exports, o, o.exports, t), o.exports
    }
    t.n = function(r) {
            var e = r && r.__esModule ? function() {
                return r.default
            } : function() {
                return r
            };
            return t.d(e, {
                a: e
            }), e
        }, t.d = function(r, e) {
            for (var n in e) t.o(e, n) && !t.o(r, n) && Object.defineProperty(r, n, {
                enumerable: !0,
                get: e[n]
            })
        }, t.o = function(r, e) {
            return Object.prototype.hasOwnProperty.call(r, e)
        }, t.r = function(r) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(r, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(r, "__esModule", {
                value: !0
            })
        }, t.rv = function() {
            return "1.5.7"
        }, t.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var r, e = {};
            t.r(e), t.d(e, {
                TranslationProvider: function() {
                    return B
                },
                makeActionCreator: function() {
                    return Y
                },
                queryClient: function() {
                    return r1
                },
                renderWithErrorBoundary: function() {
                    return r2
                },
                useDebounce: function() {
                    return q
                },
                useInterval: function() {
                    return U
                },
                useLocalStorage: function() {
                    return $
                },
                useOnClickOutside: function() {
                    return K
                },
                usePrevious: function() {
                    return J
                },
                useTheme: function() {
                    return re
                },
                useTokens: function() {
                    return rn
                },
                useTranslation: function() {
                    return k
                },
                useWindowActiveState: function() {
                    return Z
                },
                withComponentStatus: function() {
                    return N
                },
                withTranslations: function() {
                    return T
                }
            });
            var n = {};

            function a(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            t.r(n), t.d(n, {
                TranslationProvider: function() {
                    return B
                },
                makeActionCreator: function() {
                    return Y
                },
                queryClient: function() {
                    return r1
                },
                renderWithErrorBoundary: function() {
                    return r2
                },
                useDebounce: function() {
                    return q
                },
                useInterval: function() {
                    return U
                },
                useLocalStorage: function() {
                    return $
                },
                useOnClickOutside: function() {
                    return K
                },
                usePrevious: function() {
                    return J
                },
                useTheme: function() {
                    return re
                },
                useTokens: function() {
                    return rn
                },
                useTranslation: function() {
                    return k
                },
                useWindowActiveState: function() {
                    return Z
                },
                withComponentStatus: function() {
                    return N
                },
                withTranslations: function() {
                    return T
                }
            });
            var o = function(r, e) {
                    var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
                    if ("string" == typeof r) t[r] = e;
                    else {
                        var n = function(r) {
                                if (Array.isArray(r)) return a(r)
                            }(r) || function(r) {
                                if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                            }(r) || function(r, e) {
                                if (r) {
                                    if ("string" == typeof r) return a(r, void 0);
                                    var t = Object.prototype.toString.call(r).slice(8, -1);
                                    if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a(r, e)
                                }
                            }(r) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            o = n.pop(),
                            i = t,
                            g = !0,
                            u = !1,
                            b = void 0;
                        try {
                            for (var c, l = n[Symbol.iterator](); !(g = (c = l.next()).done); g = !0) {
                                var s, d = c.value;
                                null != (s = i)[d] || (s[d] = {}), i = i[d]
                            }
                        } catch (r) {
                            u = !0, b = r
                        } finally {
                            try {
                                g || null == l.return || l.return()
                            } finally {
                                if (u) throw b
                            }
                        }
                        i[o] = e
                    }
                },
                i = function(r, e) {
                    o(r, e)
                },
                g = window.TanstackQuery,
                u = window.React,
                b = t.n(u),
                c = window.ReactJSX,
                l = window.Roblox["core-scripts"].intl.intl,
                s = t.n(l),
                d = window.Roblox["core-scripts"].intl.translation;

            function _(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function S(r) {
                return function(r) {
                    if (Array.isArray(r)) return _(r)
                }(r) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r, e) {
                    if (r) {
                        if ("string" == typeof r) return _(r, void 0);
                        var t = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return _(r, e)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var f = function(r) {
                    return 2 === r.split(".").length
                },
                h = function(r) {
                    return Array.isArray(r) && r.every(function(r) {
                        return "string" == typeof r
                    })
                },
                p = function(r) {
                    var e = r.common,
                        t = r.feature,
                        n = r.features;
                    if (!h(e) || void 0 !== t && void 0 !== n || null != t && "string" != typeof t || null != n && !h(n)) throw Error("Invalid namespaces config!");
                    return S(e).concat(S(null == t ? [] : [t]), S(null != n ? n : [])).filter(f)
                },
                m = function(r) {
                    if (!Array.isArray(r)) return p(r);
                    if (h(r)) return r.filter(f);
                    throw TypeError("Translation Config must be an array of strings.")
                };

            function y(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var v = function(r, e) {
                    var t = m(r),
                        n = new(s()),
                        a = new d.TranslationResourceProvider(n),
                        o = t.map(function(r) {
                            return a.getTranslationResource(r)
                        }),
                        i = a.mergeTranslationResources.apply(a, function(r) {
                            if (Array.isArray(r)) return y(r)
                        }(o) || function(r) {
                            if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                        }(o) || function(r, e) {
                            if (r) {
                                if ("string" == typeof r) return y(r, void 0);
                                var t = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return y(r, e)
                            }
                        }(o) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }());
                    return {
                        translate: function(r, t, a) {
                            var o = i.get(r, t);
                            return !o && e && e(r, n.locale), o && o.length > 0 ? o : null != a ? a : ""
                        },
                        intl: n
                    }
                },
                F = (0, u.createContext)(void 0);

            function B(r) {
                var e = r.config,
                    t = r.children,
                    n = r.onEmptyString;
                return (0, c.jsx)(F.Provider, {
                    value: v(e, n),
                    children: t
                })
            }
            var k = function() {
                var r = (0, u.useContext)(F);
                if (!r) throw Error("invalid use of `useTranslation` hook. Ensure your component has an ancestor wrapped in `TranslationProvider`");
                return r
            };

            function O(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var z = function(r, e) {
                    return "".concat(e, "(").concat(r.displayName || r.name || "Component", ")")
                },
                L = function(r) {
                    var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "withHOC";
                    return function(t) {
                        for (var n = arguments.length, a = Array(n > 1 ? n - 1 : 0), o = 1; o < n; o++) a[o - 1] = arguments[o];
                        var i = r.apply(void 0, [t].concat(function(r) {
                            if (Array.isArray(r)) return O(r)
                        }(a) || function(r) {
                            if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                        }(a) || function(r, e) {
                            if (r) {
                                if ("string" == typeof r) return O(r, void 0);
                                var t = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return O(r, e)
                            }
                        }(a) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()));
                        return i.displayName = z(t, e), i
                    }
                };

            function w(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function M(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function E(r) {
                return (E = Object.setPrototypeOf ? Object.getPrototypeOf : function(r) {
                    return r.__proto__ || Object.getPrototypeOf(r)
                })(r)
            }

            function A(r, e) {
                return (A = Object.setPrototypeOf || function(r, e) {
                    return r.__proto__ = e, r
                })(r, e)
            }

            function P() {
                try {
                    var r = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (r) {}
                return (P = function() {
                    return !!r
                })()
            }
            var T = L(function(r, e) {
                    var t = m(e);
                    return function(e) {
                        var n;
                        if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                        function a(r) {
                            if (!(this instanceof a)) throw TypeError("Cannot call a class as a function");
                            e = a, n = [r], e = E(e), M(o = function(r, e) {
                                var t;
                                if (e && ("object" == ((t = e) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || "function" == typeof e)) return e;
                                if (void 0 === r) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return r
                            }(this, P() ? Reflect.construct(e, n || [], E(this).constructor) : e.apply(this, n)), "intl", void 0), o.intl = new(s()), o.translate = o.translate.bind(o);
                            var e, n, o, i = new d.TranslationResourceProvider(o.intl),
                                g = t.map(function(r) {
                                    return i.getTranslationResource(r)
                                });
                            return o.state = {
                                languageResources: i.mergeTranslationResources.apply(i, function(r) {
                                    if (Array.isArray(r)) return w(r)
                                }(g) || function(r) {
                                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                                }(g) || function(r, e) {
                                    if (r) {
                                        if ("string" == typeof r) return w(r, void 0);
                                        var t = Object.prototype.toString.call(r).slice(8, -1);
                                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return w(r, e)
                                    }
                                }(g) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }, o
                        }
                        return a.prototype = Object.create(e && e.prototype, {
                                constructor: {
                                    value: a,
                                    writable: !0,
                                    configurable: !0
                                }
                            }), e && A(a, e), n = [{
                                key: "translate",
                                value: function(r, e) {
                                    return this.state.languageResources.get(r, e)
                                }
                            }, {
                                key: "render",
                                value: function() {
                                    var e, t, n = this;
                                    return (0, c.jsx)(r, (e = function(r) {
                                        for (var e = 1; e < arguments.length; e++) {
                                            var t = null != arguments[e] ? arguments[e] : {},
                                                n = Object.keys(t);
                                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                                                return Object.getOwnPropertyDescriptor(t, r).enumerable
                                            }))), n.forEach(function(e) {
                                                M(r, e, t[e])
                                            })
                                        }
                                        return r
                                    }({}, this.props), t = t = {
                                        translate: function(r, e) {
                                            return n.translate(r, e)
                                        },
                                        intl: this.intl
                                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(r, e) {
                                        var t = Object.keys(r);
                                        if (Object.getOwnPropertySymbols) {
                                            var n = Object.getOwnPropertySymbols(r);
                                            t.push.apply(t, n)
                                        }
                                        return t
                                    })(Object(t)).forEach(function(r) {
                                        Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                                    }), e))
                                }
                            }],
                            function(r, e) {
                                for (var t = 0; t < e.length; t++) {
                                    var n = e[t];
                                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                                }
                            }(a.prototype, n), a
                    }(b().Component)
                }, "withTranslations"),
                W = window.PropTypes,
                j = t.n(W),
                I = t(942),
                C = t.n(I),
                D = function(r, e) {
                    console.warn("The following exception has been caught with the captured component stack:"), console.group(), console.info("".concat(r)), console.info("".concat(e.componentStack)), console.groupEnd()
                };

            function H(r, e) {
                for (var t = 0; t < e.length; t++) {
                    var n = e[t];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                }
            }

            function R(r) {
                return (R = Object.setPrototypeOf ? Object.getPrototypeOf : function(r) {
                    return r.__proto__ || Object.getPrototypeOf(r)
                })(r)
            }

            function G(r, e) {
                return (G = Object.setPrototypeOf || function(r, e) {
                    return r.__proto__ = e, r
                })(r, e)
            }

            function x() {
                try {
                    var r = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (r) {}
                return (x = function() {
                    return !!r
                })()
            }
            var N = L(function(r) {
                var e = function(e) {
                    var t, n;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function a(r) {
                        if (!(this instanceof a)) throw TypeError("Cannot call a class as a function");
                        e = a, t = [r], e = R(e);
                        var e, t, n, o = (n = function(r, e) {
                            var t;
                            if (e && ("object" == ((t = e) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || "function" == typeof e)) return e;
                            if (void 0 === r) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return r
                        }(this, x() ? Reflect.construct(e, t || [], R(this).constructor) : e.apply(this, t))).props.showAppOnInit;
                        return n.state = {
                            isLoading: !o,
                            hasError: !1,
                            errorState: null
                        }, n.onLoadStart = n.onLoadStart.bind(n), n.onLoadEnd = n.onLoadEnd.bind(n), n.onError = n.onError.bind(n), n
                    }
                    return a.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: a,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && G(a, e), n = [{
                        key: "getDerivedStateFromError",
                        value: function() {
                            return {
                                hasError: !0,
                                errorState: null
                            }
                        }
                    }], t = [{
                        key: "componentDidCatch",
                        value: function(r, e) {
                            D(r, e)
                        }
                    }, {
                        key: "onLoadStart",
                        value: function() {
                            this.setState({
                                isLoading: !0
                            })
                        }
                    }, {
                        key: "onLoadEnd",
                        value: function() {
                            this.setState({
                                isLoading: !1
                            })
                        }
                    }, {
                        key: "onError",
                        value: function(r) {
                            this.setState({
                                hasError: !0,
                                errorState: r
                            })
                        }
                    }, {
                        key: "render",
                        value: function() {
                            var e, t, n, a, o = this.props,
                                i = o.defaultMessage,
                                g = o.errorStates,
                                u = function(r, e) {
                                    if (null == r) return {};
                                    var t, n, a = function(r, e) {
                                        if (null == r) return {};
                                        var t, n, a = {},
                                            o = Object.keys(r);
                                        for (n = 0; n < o.length; n++) t = o[n], e.indexOf(t) >= 0 || (a[t] = r[t]);
                                        return a
                                    }(r, e);
                                    if (Object.getOwnPropertySymbols) {
                                        var o = Object.getOwnPropertySymbols(r);
                                        for (n = 0; n < o.length; n++) t = o[n], !(e.indexOf(t) >= 0) && Object.prototype.propertyIsEnumerable.call(r, t) && (a[t] = r[t])
                                    }
                                    return a
                                }(o, ["defaultMessage", "errorStates"]),
                                b = this.state,
                                l = b.isLoading,
                                s = b.hasError,
                                d = b.errorState;
                            s ? n = (0, c.jsx)("h3", {
                                children: g[d] ? g[d] : i
                            }) : (n = (0, c.jsx)("span", {
                                className: "spinner spinner-default"
                            }), a = (0, c.jsx)(r, (e = function(r) {
                                for (var e = 1; e < arguments.length; e++) {
                                    var t = null != arguments[e] ? arguments[e] : {},
                                        n = Object.keys(t);
                                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                                    }))), n.forEach(function(e) {
                                        var n;
                                        n = t[e], e in r ? Object.defineProperty(r, e, {
                                            value: n,
                                            enumerable: !0,
                                            configurable: !0,
                                            writable: !0
                                        }) : r[e] = n
                                    })
                                }
                                return r
                            }({}, u), t = t = {
                                isLoading: l,
                                hasError: s,
                                errorState: d,
                                onLoadStart: this.onLoadStart,
                                onLoadEnd: this.onLoadEnd,
                                onError: this.onError
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(r, e) {
                                var t = Object.keys(r);
                                if (Object.getOwnPropertySymbols) {
                                    var n = Object.getOwnPropertySymbols(r);
                                    t.push.apply(t, n)
                                }
                                return t
                            })(Object(t)).forEach(function(r) {
                                Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                            }), e)));
                            var _ = s || l,
                                S = C()("component-status-container", {
                                    hidden: !_
                                }),
                                f = C()("component-container", {
                                    hidden: _
                                });
                            return (0, c.jsxs)("div", {
                                className: "component-status",
                                children: [(0, c.jsx)("div", {
                                    className: S,
                                    children: n
                                }), (0, c.jsx)("div", {
                                    className: f,
                                    children: a
                                })]
                            })
                        }
                    }], H(a.prototype, t), n && H(a, n), a
                }(b().Component);
                return e.defaultProps = {
                    showAppOnInit: !1,
                    defaultMessage: "",
                    errorStates: {}
                }, e.propTypes = {
                    showAppOnInit: j().bool,
                    defaultMessage: j().string,
                    errorStates: j().objectOf(j().string)
                }, e
            }, "withComponentStatus");

            function X(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function Y(r) {
                for (var e = arguments.length, t = Array(e > 1 ? e - 1 : 0), n = 1; n < e; n++) t[n - 1] = arguments[n];
                return function() {
                    for (var e = arguments.length, n = Array(e), a = 0; a < e; a++) n[a] = arguments[a];
                    return function(r) {
                        for (var e = 1; e < arguments.length; e++) {
                            var t = null != arguments[e] ? arguments[e] : {},
                                n = Object.keys(t);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                                return Object.getOwnPropertyDescriptor(t, r).enumerable
                            }))), n.forEach(function(e) {
                                X(r, e, t[e])
                            })
                        }
                        return r
                    }({
                        type: r
                    }, t.reduce(function(r, e, t) {
                        return Object.assign(r, X({}, e, n[t]))
                    }, {}))
                }
            }
            var q = function(r, e) {
                    var t = (0, u.useState)(r),
                        n = t[0],
                        a = t[1];
                    return (0, u.useEffect)(function() {
                        var t = setTimeout(function() {
                            a(r)
                        }, e);
                        return function() {
                            clearTimeout(t)
                        }
                    }, [r, e]), n
                },
                U = function(r, e) {
                    var t = (0, u.useRef)(r);
                    (0, u.useEffect)(function() {
                        t.current = r
                    }, [r]), (0, u.useEffect)(function() {
                        if (null !== e) {
                            var r = setInterval(function() {
                                return t.current()
                            }, e);
                            return function() {
                                clearInterval(r)
                            }
                        }
                    }, [e])
                },
                $ = function(r, e) {
                    var t = function() {
                            if ("undefined" == typeof window) return e;
                            try {
                                var t = window.localStorage.getItem(r);
                                return t ? JSON.parse(t) : e
                            } catch (t) {
                                return console.warn("Error reading localStorage key “" + r + "”:", t), e
                            }
                        },
                        n = (0, u.useState)(t),
                        a = n[0],
                        o = n[1],
                        i = (0, u.useCallback)(function(e) {
                            "undefined" == typeof window && console.warn("Tried setting localStorage key “" + r + "” even though environment is not a client");
                            try {
                                var t, n = (t = Function, null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) ? e(a) : e;
                                window.localStorage.setItem(r, JSON.stringify(n)), o(n), window.dispatchEvent(new Event("local-storage"))
                            } catch (e) {
                                console.warn("Error setting localStorage key “" + r + "”:", e)
                            }
                        }, [r, a]);
                    return (0, u.useEffect)(function() {
                        o(t())
                    }, []), (0, u.useEffect)(function() {
                        var r = function() {
                            o(t())
                        };
                        return window.addEventListener("storage", r), window.addEventListener("local-storage", r),
                            function() {
                                window.removeEventListener("storage", r), window.removeEventListener("local-storage", r)
                            }
                    }, []), [a, i]
                },
                K = function(r, e) {
                    (0, u.useEffect)(function() {
                        var t = function(t) {
                            r.every(function(r) {
                                return !(null == r ? void 0 : r.current)
                            }) || r.findIndex(function(r) {
                                var e, n, a;
                                return n = t.target, (null != (a = Node) && "undefined" != typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](n) : n instanceof a) && (null == (e = null == r ? void 0 : r.current) ? void 0 : e.contains(t.target))
                            }) > -1 || e(t)
                        };
                        return document.addEventListener("mousedown", t), document.addEventListener("touchstart", t),
                            function() {
                                document.removeEventListener("mousedown", t), document.removeEventListener("touchstart", t)
                            }
                    }, [r, e])
                },
                J = function(r) {
                    var e = (0, u.useRef)();
                    return (0, u.useEffect)(function() {
                        e.current = r
                    }, [r]), e.current
                },
                V = ["focus", "click", "hover", "scroll", "mouseover", "mouseenter", "mousedown", "dblclick", "keypress", "touchstart", "touchmove"],
                Q = ["blur"],
                Z = function() {
                    var r = (0, u.useState)(!1),
                        e = r[0],
                        t = r[1],
                        n = (0, u.useCallback)(function() {
                            t(!0)
                        }, []),
                        a = (0, u.useCallback)(function() {
                            t(!1)
                        }, []);
                    return (0, u.useEffect)(function() {
                        return V.forEach(function(r) {
                                window.addEventListener(r, n)
                            }), Q.forEach(function(r) {
                                window.addEventListener(r, a)
                            }),
                            function() {
                                V.forEach(function(r) {
                                    window.removeEventListener(r, n)
                                }), Q.forEach(function(r) {
                                    window.removeEventListener(r, a)
                                })
                            }
                    }, [n, a]), e
                };

            function rr(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var re = function() {
                    var r, e = (r = (0, u.useState)(document.body.classList.contains("dark-theme")), function(r) {
                            if (Array.isArray(r)) return r
                        }(r) || function(r, e) {
                            var t, n, a = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    g = !1;
                                try {
                                    for (a = a.call(r); !(i = (t = a.next()).done) && (o.push(t.value), o.length !== e); i = !0);
                                } catch (r) {
                                    g = !0, n = r
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (g) throw n
                                    }
                                }
                                return o
                            }
                        }(r, 2) || function(r, e) {
                            if (r) {
                                if ("string" == typeof r) return rr(r, 2);
                                var t = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rr(r, e)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        t = e[0],
                        n = e[1];
                    return (0, u.useEffect)(function() {
                        var r = new MutationObserver(function() {
                            n(document.body.classList.contains("dark-theme"))
                        });
                        return r.observe(document.body, {
                                attributeFilter: ["class"]
                            }),
                            function() {
                                r.disconnect()
                            }
                    }, []), t ? "dark" : "light"
                },
                rt = t(339),
                rn = function() {
                    var r = re();
                    return (0, u.useMemo)(function() {
                        return "dark" === r ? rt.FoundationDark : rt.FoundationLight
                    }, [r])
                },
                ra = window.ReactDOM,
                ro = "9.46.0",
                ri = globalThis;

            function rg() {
                return ru(ri), ri
            }

            function ru(r) {
                var e = r.__SENTRY__ = r.__SENTRY__ || {};
                return e.version = e.version || ro, e[ro] = e[ro] || {}
            }

            function rb(r, e) {
                var t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : ri,
                    n = t.__SENTRY__ = t.__SENTRY__ || {},
                    a = n[ro] = n[ro] || {};
                return a[r] || (a[r] = e())
            }
            var rc = "undefined" == typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function rl() {
                var r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : ri.crypto || ri.msCrypto,
                    e = function() {
                        return 16 * Math.random()
                    };
                try {
                    if (null == r ? void 0 : r.randomUUID) return r.randomUUID().replace(/-/g, "");
                    (null == r ? void 0 : r.getRandomValues) && (e = function() {
                        var e = new Uint8Array(1);
                        return r.getRandomValues(e), e[0]
                    })
                } catch (r) {}
                return "10000000100040008000100000000000".replace(/[018]/g, function(r) {
                    return (r ^ (15 & e()) >> r / 4).toString(16)
                })
            }

            function rs() {
                return Date.now() / 1e3
            }

            function rd(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function r_(r) {
                return function(r) {
                    if (Array.isArray(r)) return rd(r)
                }(r) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r, e) {
                    if (r) {
                        if ("string" == typeof r) return rd(r, void 0);
                        var t = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rd(r, e)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rS = {};

            function rf(r) {
                if (!("console" in ri)) return r();
                var e = ri.console,
                    t = {},
                    n = Object.keys(rS);
                n.forEach(function(r) {
                    var n = rS[r];
                    t[r] = e[r], e[r] = n
                });
                try {
                    return r()
                } finally {
                    n.forEach(function(r) {
                        e[r] = t[r]
                    })
                }
            }

            function rh(r) {
                for (var e = arguments.length, t = Array(e > 1 ? e - 1 : 0), n = 1; n < e; n++) t[n - 1] = arguments[n];
                rc && function() {
                    return rc ? rb("loggerSettings", function() {
                        return {
                            enabled: !1
                        }
                    }) : {
                        enabled: !1
                    }
                }().enabled && rf(function() {
                    var e;
                    (e = ri.console)[r].apply(e, ["".concat("Sentry Logger ", "[").concat(r, "]:")].concat(r_(t)))
                })
            }
            var rp = function() {
                    for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                    rh.apply(void 0, ["log"].concat(r_(e)))
                },
                rm = function() {
                    for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                    rh.apply(void 0, ["warn"].concat(r_(e)))
                },
                ry = function() {
                    for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                    rh.apply(void 0, ["error"].concat(r_(e)))
                },
                rv = Object.prototype.toString,
                rF = "_sentrySpan";

            function rB(r, e) {
                if (e) try {
                    Object.defineProperty(r, rF, {
                        value: e,
                        writable: !0,
                        configurable: !0
                    })
                } catch (e) {
                    rc && rp('Failed to add non-enumerable property "'.concat(rF, '" to object'), r)
                } else delete r[rF]
            }

            function rk(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function rO(r, e, t) {
                return e in r ? Object.defineProperty(r, e, {
                    value: t,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[e] = t, r
            }

            function rz(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        rO(r, e, t[e])
                    })
                }
                return r
            }

            function rL(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r, e) {
                    var t = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(r);
                        t.push.apply(t, n)
                    }
                    return t
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function rw(r) {
                return function(r) {
                    if (Array.isArray(r)) return rk(r)
                }(r) || function(r) {
                    if ("undefined" != typeof Symbol && null != r[Symbol.iterator] || null != r["@@iterator"]) return Array.from(r)
                }(r) || function(r, e) {
                    if (r) {
                        if ("string" == typeof r) return rk(r, void 0);
                        var t = Object.prototype.toString.call(r).slice(8, -1);
                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rk(r, e)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rM = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        this._notifyingListeners = !1, this._scopeListeners = [], this._eventProcessors = [], this._breadcrumbs = [], this._attachments = [], this._user = {}, this._tags = {}, this._extra = {}, this._contexts = {}, this._sdkProcessingMetadata = {}, this._propagationContext = {
                            traceId: rl(),
                            sampleRand: Math.random()
                        }
                    }
                    return e = [{
                            key: "clone",
                            value: function() {
                                var r = new t;
                                return r._breadcrumbs = rw(this._breadcrumbs), r._tags = rz({}, this._tags), r._extra = rz({}, this._extra), r._contexts = rz({}, this._contexts), this._contexts.flags && (r._contexts.flags = {
                                    values: rw(this._contexts.flags.values)
                                }), r._user = this._user, r._level = this._level, r._session = this._session, r._transactionName = this._transactionName, r._fingerprint = this._fingerprint, r._eventProcessors = rw(this._eventProcessors), r._attachments = rw(this._attachments), r._sdkProcessingMetadata = rz({}, this._sdkProcessingMetadata), r._propagationContext = rz({}, this._propagationContext), r._client = this._client, r._lastEventId = this._lastEventId, rB(r, this[rF]), r
                            }
                        }, {
                            key: "setClient",
                            value: function(r) {
                                this._client = r
                            }
                        }, {
                            key: "setLastEventId",
                            value: function(r) {
                                this._lastEventId = r
                            }
                        }, {
                            key: "getClient",
                            value: function() {
                                return this._client
                            }
                        }, {
                            key: "lastEventId",
                            value: function() {
                                return this._lastEventId
                            }
                        }, {
                            key: "addScopeListener",
                            value: function(r) {
                                this._scopeListeners.push(r)
                            }
                        }, {
                            key: "addEventProcessor",
                            value: function(r) {
                                return this._eventProcessors.push(r), this
                            }
                        }, {
                            key: "setUser",
                            value: function(e) {
                                return this._user = e || {
                                    email: void 0,
                                    id: void 0,
                                    ip_address: void 0,
                                    username: void 0
                                }, this._session && function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                                    if (t.user && (!e.ipAddress && t.user.ip_address && (e.ipAddress = t.user.ip_address), e.did || t.did || (e.did = t.user.id || t.user.email || t.user.username)), e.timestamp = t.timestamp || (null != r ? r : r = function() {
                                            var r = ri.performance;
                                            if (!(null == r ? void 0 : r.now) || !r.timeOrigin) return rs;
                                            var e = r.timeOrigin;
                                            return function() {
                                                return (e + r.now()) / 1e3
                                            }
                                        }())(), t.abnormal_mechanism && (e.abnormal_mechanism = t.abnormal_mechanism), t.ignoreDuration && (e.ignoreDuration = t.ignoreDuration), t.sid && (e.sid = 32 === t.sid.length ? t.sid : rl()), void 0 !== t.init && (e.init = t.init), !e.did && t.did && (e.did = "".concat(t.did)), "number" == typeof t.started && (e.started = t.started), e.ignoreDuration) e.duration = void 0;
                                    else if ("number" == typeof t.duration) e.duration = t.duration;
                                    else {
                                        var n = e.timestamp - e.started;
                                        e.duration = n >= 0 ? n : 0
                                    }
                                    t.release && (e.release = t.release), t.environment && (e.environment = t.environment), !e.ipAddress && t.ipAddress && (e.ipAddress = t.ipAddress), !e.userAgent && t.userAgent && (e.userAgent = t.userAgent), "number" == typeof t.errors && (e.errors = t.errors), t.status && (e.status = t.status)
                                }(this._session, {
                                    user: e
                                }), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "getUser",
                            value: function() {
                                return this._user
                            }
                        }, {
                            key: "setTags",
                            value: function(r) {
                                return this._tags = rz({}, this._tags, r), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setTag",
                            value: function(r, e) {
                                return this._tags = rL(rz({}, this._tags), rO({}, r, e)), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setExtras",
                            value: function(r) {
                                return this._extra = rz({}, this._extra, r), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setExtra",
                            value: function(r, e) {
                                return this._extra = rL(rz({}, this._extra), rO({}, r, e)), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setFingerprint",
                            value: function(r) {
                                return this._fingerprint = r, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setLevel",
                            value: function(r) {
                                return this._level = r, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setTransactionName",
                            value: function(r) {
                                return this._transactionName = r, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setContext",
                            value: function(r, e) {
                                return null === e ? delete this._contexts[r] : this._contexts[r] = e, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "setSession",
                            value: function(r) {
                                return r ? this._session = r : delete this._session, this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "getSession",
                            value: function() {
                                return this._session
                            }
                        }, {
                            key: "update",
                            value: function(r) {
                                if (!r) return this;
                                var e = "function" == typeof r ? r(this) : r,
                                    n = ((null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) ? e.getScopeData() : rv.call(e) === "[object ".concat("Object", "]") ? r : void 0) || {},
                                    a = n.tags,
                                    o = n.extra,
                                    i = n.user,
                                    g = n.contexts,
                                    u = n.level,
                                    b = n.fingerprint,
                                    c = void 0 === b ? [] : b,
                                    l = n.propagationContext;
                                return this._tags = rz({}, this._tags, a), this._extra = rz({}, this._extra, o), this._contexts = rz({}, this._contexts, g), i && Object.keys(i).length && (this._user = i), u && (this._level = u), c.length && (this._fingerprint = c), l && (this._propagationContext = l), this
                            }
                        }, {
                            key: "clear",
                            value: function() {
                                return this._breadcrumbs = [], this._tags = {}, this._extra = {}, this._user = {}, this._contexts = {}, this._level = void 0, this._transactionName = void 0, this._fingerprint = void 0, this._session = void 0, rB(this, void 0), this._attachments = [], this.setPropagationContext({
                                    traceId: rl(),
                                    sampleRand: Math.random()
                                }), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "addBreadcrumb",
                            value: function(r, e) {
                                var t, n = "number" == typeof e ? e : 100;
                                if (n <= 0) return this;
                                var a = rL(rz({
                                    timestamp: rs()
                                }, r), {
                                    message: r.message ? function(r) {
                                        var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                                        return "string" != typeof r || 0 === e || r.length <= e ? r : "".concat(r.slice(0, e), "...")
                                    }(r.message, 2048) : r.message
                                });
                                return this._breadcrumbs.push(a), this._breadcrumbs.length > n && (this._breadcrumbs = this._breadcrumbs.slice(-n), null == (t = this._client) || t.recordDroppedEvent("buffer_overflow", "log_item")), this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "getLastBreadcrumb",
                            value: function() {
                                return this._breadcrumbs[this._breadcrumbs.length - 1]
                            }
                        }, {
                            key: "clearBreadcrumbs",
                            value: function() {
                                return this._breadcrumbs = [], this._notifyScopeListeners(), this
                            }
                        }, {
                            key: "addAttachment",
                            value: function(r) {
                                return this._attachments.push(r), this
                            }
                        }, {
                            key: "clearAttachments",
                            value: function() {
                                return this._attachments = [], this
                            }
                        }, {
                            key: "getScopeData",
                            value: function() {
                                return {
                                    breadcrumbs: this._breadcrumbs,
                                    attachments: this._attachments,
                                    contexts: this._contexts,
                                    tags: this._tags,
                                    extra: this._extra,
                                    user: this._user,
                                    level: this._level,
                                    fingerprint: this._fingerprint || [],
                                    eventProcessors: this._eventProcessors,
                                    propagationContext: this._propagationContext,
                                    sdkProcessingMetadata: this._sdkProcessingMetadata,
                                    transactionName: this._transactionName,
                                    span: this[rF]
                                }
                            }
                        }, {
                            key: "setSDKProcessingMetadata",
                            value: function(r) {
                                return this._sdkProcessingMetadata = function r(e, t) {
                                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 2;
                                    if (!t || (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) != "object" || n <= 0) return t;
                                    if (e && 0 === Object.keys(t).length) return e;
                                    var a = function(r) {
                                        for (var e = 1; e < arguments.length; e++) {
                                            var t = null != arguments[e] ? arguments[e] : {},
                                                n = Object.keys(t);
                                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                                                return Object.getOwnPropertyDescriptor(t, r).enumerable
                                            }))), n.forEach(function(e) {
                                                var n;
                                                n = t[e], e in r ? Object.defineProperty(r, e, {
                                                    value: n,
                                                    enumerable: !0,
                                                    configurable: !0,
                                                    writable: !0
                                                }) : r[e] = n
                                            })
                                        }
                                        return r
                                    }({}, e);
                                    for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && (a[o] = r(a[o], t[o], n - 1));
                                    return a
                                }(this._sdkProcessingMetadata, r, 2), this
                            }
                        }, {
                            key: "setPropagationContext",
                            value: function(r) {
                                return this._propagationContext = r, this
                            }
                        }, {
                            key: "getPropagationContext",
                            value: function() {
                                return this._propagationContext
                            }
                        }, {
                            key: "captureException",
                            value: function(r, e) {
                                var t = (null == e ? void 0 : e.event_id) || rl();
                                if (!this._client) return rc && rm("No client configured on scope - will not capture exception!"), t;
                                var n = Error("Sentry syntheticException");
                                return this._client.captureException(r, rL(rz({
                                    originalException: r,
                                    syntheticException: n
                                }, e), {
                                    event_id: t
                                }), this), t
                            }
                        }, {
                            key: "captureMessage",
                            value: function(r, e, t) {
                                var n = (null == t ? void 0 : t.event_id) || rl();
                                if (!this._client) return rc && rm("No client configured on scope - will not capture message!"), n;
                                var a = Error(r);
                                return this._client.captureMessage(r, e, rL(rz({
                                    originalException: r,
                                    syntheticException: a
                                }, t), {
                                    event_id: n
                                }), this), n
                            }
                        }, {
                            key: "captureEvent",
                            value: function(r, e) {
                                var t = (null == e ? void 0 : e.event_id) || rl();
                                return this._client ? this._client.captureEvent(r, rL(rz({}, e), {
                                    event_id: t
                                }), this) : rc && rm("No client configured on scope - will not capture event!"), t
                            }
                        }, {
                            key: "_notifyScopeListeners",
                            value: function() {
                                var r = this;
                                this._notifyingListeners || (this._notifyingListeners = !0, this._scopeListeners.forEach(function(e) {
                                    e(r)
                                }), this._notifyingListeners = !1)
                            }
                        }],
                        function(r, e) {
                            for (var t = 0; t < e.length; t++) {
                                var n = e[t];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                            }
                        }(t.prototype, e), t
                }(),
                rE = function() {
                    var r;

                    function e(r, t) {
                        var n, a;
                        if (!(this instanceof e)) throw TypeError("Cannot call a class as a function");
                        n = r || new rM, a = t || new rM, this._stack = [{
                            scope: n
                        }], this._isolationScope = a
                    }
                    return r = [{
                            key: "withScope",
                            value: function(r) {
                                var e, t, n = this,
                                    a = this._pushScope();
                                try {
                                    t = r(a)
                                } catch (r) {
                                    throw this._popScope(), r
                                }
                                return (null == (e = t) ? void 0 : e.then) && "function" == typeof e.then ? t.then(function(r) {
                                    return n._popScope(), r
                                }, function(r) {
                                    throw n._popScope(), r
                                }) : (this._popScope(), t)
                            }
                        }, {
                            key: "getClient",
                            value: function() {
                                return this.getStackTop().client
                            }
                        }, {
                            key: "getScope",
                            value: function() {
                                return this.getStackTop().scope
                            }
                        }, {
                            key: "getIsolationScope",
                            value: function() {
                                return this._isolationScope
                            }
                        }, {
                            key: "getStackTop",
                            value: function() {
                                return this._stack[this._stack.length - 1]
                            }
                        }, {
                            key: "_pushScope",
                            value: function() {
                                var r = this.getScope().clone();
                                return this._stack.push({
                                    client: this.getClient(),
                                    scope: r
                                }), r
                            }
                        }, {
                            key: "_popScope",
                            value: function() {
                                return !(this._stack.length <= 1) && !!this._stack.pop()
                            }
                        }],
                        function(r, e) {
                            for (var t = 0; t < e.length; t++) {
                                var n = e[t];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                            }
                        }(e.prototype, r), e
                }();

            function rA() {
                var r = ru(rg());
                return r.stack = r.stack || new rE(rb("defaultCurrentScope", function() {
                    return new rM
                }), rb("defaultIsolationScope", function() {
                    return new rM
                }))
            }

            function rP(r) {
                return rA().withScope(r)
            }

            function rT(r, e) {
                var t = rA();
                return t.withScope(function() {
                    return t.getStackTop().scope = r, e(r)
                })
            }

            function rW(r) {
                return rA().withScope(function() {
                    return r(rA().getIsolationScope())
                })
            }

            function rj(r) {
                var e = ru(r);
                return e.acs ? e.acs : {
                    withIsolationScope: rW,
                    withScope: rP,
                    withSetScope: rT,
                    withSetIsolationScope: function(r, e) {
                        return rW(e)
                    },
                    getCurrentScope: function() {
                        return rA().getScope()
                    },
                    getIsolationScope: function() {
                        return rA().getIsolationScope()
                    }
                }
            }

            function rI(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }

            function rC() {
                return rj(rg()).getCurrentScope()
            }

            function rD() {
                for (var r = arguments.length, e = Array(r), t = 0; t < r; t++) e[t] = arguments[t];
                var n = rj(rg());
                if (2 === e.length) {
                    var a = function(r) {
                            if (Array.isArray(r)) return r
                        }(e) || function(r, e) {
                            var t, n, a = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    g = !1;
                                try {
                                    for (a = a.call(r); !(i = (t = a.next()).done) && (o.push(t.value), o.length !== e); i = !0);
                                } catch (r) {
                                    g = !0, n = r
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (g) throw n
                                    }
                                }
                                return o
                            }
                        }(e, 2) || function(r, e) {
                            if (r) {
                                if ("string" == typeof r) return rI(r, 2);
                                var t = Object.prototype.toString.call(r).slice(8, -1);
                                if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rI(r, e)
                            }
                        }(e, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = a[0],
                        i = a[1];
                    return o ? n.withSetScope(o, i) : n.withScope(i)
                }
                return n.withScope(e[0])
            }

            function rH() {
                return rC().getClient()
            }
            var rR = ["user", "level", "extra", "contexts", "tags", "fingerprint", "propagationContext"];

            function rG(r, e) {
                (null == e || e > r.length) && (e = r.length);
                for (var t = 0, n = Array(e); t < e; t++) n[t] = r[t];
                return n
            }
            var rx = /^(?:(\w+):)\/\/(?:(\w+)(?::(\w+)?)?@)([\w.-]+)(?::(\d+))?\/(.+)/;

            function rN(r) {
                return {
                    protocol: r.protocol,
                    publicKey: r.publicKey || "",
                    pass: r.pass || "",
                    host: r.host,
                    port: r.port || "",
                    path: r.path || "",
                    projectId: r.projectId
                }
            }
            var rX = "undefined" == typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function rY(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        var n;
                        n = t[e], e in r ? Object.defineProperty(r, e, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[e] = n
                    })
                }
                return r
            }

            function rq() {
                var r, e, t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    n = ri.document,
                    a = (null == n ? void 0 : n.head) || (null == n ? void 0 : n.body);
                if (!a) {
                    rX && ry("[showReportDialog] Global document not defined");
                    return
                }
                var o = rC(),
                    i = rH(),
                    g = null == i ? void 0 : i.getDsn();
                if (!g) {
                    rX && ry("[showReportDialog] DSN not configured");
                    return
                }
                var u = (r = rY({}, t), e = e = {
                        user: rY({}, o.getUser(), t.user),
                        eventId: t.eventId || rj(rg()).getIsolationScope().lastEventId()
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r, e) {
                        var t = Object.keys(r);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(r);
                            t.push.apply(t, n)
                        }
                        return t
                    })(Object(e)).forEach(function(t) {
                        Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                    }), r),
                    b = ri.document.createElement("script");
                b.async = !0, b.crossOrigin = "anonymous", b.src = function(r, e) {
                    var t, n, a = function(r) {
                        var e = "string" == typeof r ? function(r) {
                            var e, t = rx.exec(r);
                            if (!t) return void rf(function() {
                                console.error("Invalid Sentry Dsn: ".concat(r))
                            });
                            var n = (e = t.slice(1), function(r) {
                                    if (Array.isArray(r)) return r
                                }(e) || function(r, e) {
                                    var t, n, a = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
                                    if (null != a) {
                                        var o = [],
                                            i = !0,
                                            g = !1;
                                        try {
                                            for (a = a.call(r); !(i = (t = a.next()).done) && (o.push(t.value), o.length !== e); i = !0);
                                        } catch (r) {
                                            g = !0, n = r
                                        } finally {
                                            try {
                                                i || null == a.return || a.return()
                                            } finally {
                                                if (g) throw n
                                            }
                                        }
                                        return o
                                    }
                                }(e, 6) || function(r, e) {
                                    if (r) {
                                        if ("string" == typeof r) return rG(r, 6);
                                        var t = Object.prototype.toString.call(r).slice(8, -1);
                                        if ("Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rG(r, e)
                                    }
                                }(e, 6) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()),
                                a = n[0],
                                o = n[1],
                                i = n[2],
                                g = n[3],
                                u = n[4],
                                b = n[5],
                                c = "",
                                l = void 0 === b ? "" : b,
                                s = l.split("/");
                            if (s.length > 1 && (c = s.slice(0, -1).join("/"), l = s.pop()), l) {
                                var d = l.match(/^\d+/);
                                d && (l = d[0])
                            }
                            return rN({
                                host: void 0 === g ? "" : g,
                                pass: void 0 === i ? "" : i,
                                path: c,
                                projectId: l,
                                port: void 0 === u ? "" : u,
                                protocol: a,
                                publicKey: o
                            })
                        }(r) : rN(r);
                        if (e && function(r) {
                                if (!rc) return !0;
                                var e = r.port,
                                    t = r.projectId,
                                    n = r.protocol;
                                return !["protocol", "publicKey", "host", "projectId"].find(function(e) {
                                    return !r[e] && (ry("Invalid Sentry Dsn: ".concat(e, " missing")), !0)
                                }) && (t.match(/^\d+$/) ? "http" !== n && "https" !== n ? (ry("Invalid Sentry Dsn: Invalid protocol ".concat(n)), !1) : !(e && isNaN(parseInt(e, 10))) || (ry("Invalid Sentry Dsn: Invalid port ".concat(e)), !1) : (ry("Invalid Sentry Dsn: Invalid projectId ".concat(t)), !1))
                            }(e)) return e
                    }(r);
                    if (!a) return "";
                    var o = "".concat((t = a.protocol ? "".concat(a.protocol, ":") : "", n = a.port ? ":".concat(a.port) : "", "".concat(t, "//").concat(a.host).concat(n).concat(a.path ? "/".concat(a.path) : "", "/api/")), "embed/error-page/"),
                        i = "dsn=".concat(function(r) {
                            var e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                                t = r.host,
                                n = r.path,
                                a = r.pass,
                                o = r.port,
                                i = r.projectId,
                                g = r.protocol,
                                u = r.publicKey;
                            return "".concat(g, "://").concat(u).concat(e && a ? ":".concat(a) : "") + "@".concat(t).concat(o ? ":".concat(o) : "", "/").concat(n ? "".concat(n, "/") : n).concat(i)
                        }(a));
                    for (var g in e)
                        if ("dsn" !== g && "onClose" !== g)
                            if ("user" === g) {
                                var u = e.user;
                                if (!u) continue;
                                u.name && (i += "&name=".concat(encodeURIComponent(u.name))), u.email && (i += "&email=".concat(encodeURIComponent(u.email)))
                            } else i += "&".concat(encodeURIComponent(g), "=").concat(encodeURIComponent(e[g]));
                    return "".concat(o, "?").concat(i)
                }(g, u);
                var c = u.onLoad,
                    l = u.onClose;
                if (c && (b.onload = c), l) {
                    var s = function(r) {
                        if ("__sentry_reportdialog_closed__" === r.data) try {
                            l()
                        } finally {
                            ri.removeEventListener("message", s)
                        }
                    };
                    ri.addEventListener("message", s)
                }
                a.appendChild(b)
            }
            var rU = "undefined" == typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;

            function r$(r) {
                return (r$ = Object.setPrototypeOf ? Object.getPrototypeOf : function(r) {
                    return r.__proto__ || Object.getPrototypeOf(r)
                })(r)
            }

            function rK(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        var n;
                        n = t[e], e in r ? Object.defineProperty(r, e, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[e] = n
                    })
                }
                return r
            }

            function rJ(r, e) {
                return e = null != e ? e : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(e)) : (function(r, e) {
                    var t = Object.keys(r);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(r);
                        t.push.apply(t, n)
                    }
                    return t
                })(Object(e)).forEach(function(t) {
                    Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(e, t))
                }), r
            }

            function rV(r, e) {
                return (rV = Object.setPrototypeOf || function(r, e) {
                    return r.__proto__ = e, r
                })(r, e)
            }

            function rQ() {
                try {
                    var r = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (r) {}
                return (rQ = function() {
                    return !!r
                })()
            }
            var rZ = {
                    componentStack: null,
                    error: null,
                    eventId: null
                },
                r0 = function(r) {
                    var e;
                    if ("function" != typeof r && null !== r) throw TypeError("Super expression must either be null or a function");

                    function t(r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        e = t, n = [r], e = r$(e), (a = function(r, e) {
                            var t;
                            if (e && ("object" == ((t = e) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || "function" == typeof e)) return e;
                            if (void 0 === r) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return r
                        }(this, rQ() ? Reflect.construct(e, n || [], r$(this).constructor) : e.apply(this, n))).state = rZ, a._openFallbackReportDialog = !0;
                        var e, n, a, o = rH();
                        return o && r.showDialog && (a._openFallbackReportDialog = !1, a._cleanupHook = o.on("afterSendEvent", function(e) {
                            !e.type && a._lastEventId && e.event_id === a._lastEventId && rq(rJ(rK({}, r.dialogOptions), {
                                eventId: a._lastEventId
                            }))
                        })), a
                    }
                    return t.prototype = Object.create(r && r.prototype, {
                            constructor: {
                                value: t,
                                writable: !0,
                                configurable: !0
                            }
                        }), r && rV(t, r), e = [{
                            key: "componentDidCatch",
                            value: function(r, e) {
                                var t = this,
                                    n = e.componentStack,
                                    a = this.props,
                                    o = a.beforeCapture,
                                    i = a.onError,
                                    g = a.showDialog,
                                    b = a.dialogOptions;
                                rD(function(a) {
                                    o && o(a, r, n);
                                    var c = function(r, e, t) {
                                        var n = e.componentStack;
                                        if (null !== (a = u.version.match(/^([^.]+)/)) && parseInt(a[0]) >= 17 && function(r) {
                                                switch (rv.call(r)) {
                                                    case "[object Error]":
                                                    case "[object Exception]":
                                                    case "[object DOMException]":
                                                    case "[object WebAssembly.Exception]":
                                                        return !0;
                                                    default:
                                                        var e = r,
                                                            t = Error;
                                                        try {
                                                            return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
                                                        } catch (r) {
                                                            return !1
                                                        }
                                                }
                                            }(r) && n) {
                                            var a, o, i = Error(r.message);
                                            i.name = "React ErrorBoundary ".concat(r.name), i.stack = n, o = new WeakSet,
                                                function r(e, t) {
                                                    if (!o.has(e)) {
                                                        if (e.cause) return o.add(e), r(e.cause, t);
                                                        e.cause = t
                                                    }
                                                }(r, i)
                                        }
                                        return rD(function(e) {
                                            return e.setContext("react", {
                                                componentStack: n
                                            }), rC().captureException(r, function(r) {
                                                if (r) return function(r) {
                                                    return (null != rM && "undefined" != typeof Symbol && rM[Symbol.hasInstance] ? !!rM[Symbol.hasInstance](r) : r instanceof rM) || "function" == typeof r
                                                }(r) || Object.keys(r).some(function(r) {
                                                    return rR.includes(r)
                                                }) ? {
                                                    captureContext: r
                                                } : r
                                            }(t))
                                        })
                                    }(r, e, {
                                        mechanism: {
                                            handled: null != t.props.handled ? t.props.handled : !!t.props.fallback
                                        }
                                    });
                                    i && i(r, n, c), g && (t._lastEventId = c, t._openFallbackReportDialog && rq(rJ(rK({}, b), {
                                        eventId: c
                                    }))), t.setState({
                                        error: r,
                                        componentStack: n,
                                        eventId: c
                                    })
                                })
                            }
                        }, {
                            key: "componentDidMount",
                            value: function() {
                                var r = this.props.onMount;
                                r && r()
                            }
                        }, {
                            key: "componentWillUnmount",
                            value: function() {
                                var r = this.state,
                                    e = r.error,
                                    t = r.componentStack,
                                    n = r.eventId,
                                    a = this.props.onUnmount;
                                a && (this.state === rZ ? a(null, null, null) : a(e, t, n)), this._cleanupHook && (this._cleanupHook(), this._cleanupHook = void 0)
                            }
                        }, {
                            key: "resetErrorBoundary",
                            value: function() {
                                var r = this.props.onReset,
                                    e = this.state,
                                    t = e.error,
                                    n = e.componentStack,
                                    a = e.eventId;
                                r && r(t, n, a), this.setState(rZ)
                            }
                        }, {
                            key: "render",
                            value: function() {
                                var r = this,
                                    e = this.props,
                                    t = e.fallback,
                                    n = e.children,
                                    a = this.state;
                                if (null === a.componentStack) return "function" == typeof n ? n() : n;
                                var o = "function" == typeof t ? u.createElement(t, {
                                    error: a.error,
                                    componentStack: a.componentStack,
                                    resetError: function() {
                                        return r.resetErrorBoundary()
                                    },
                                    eventId: a.eventId
                                }) : t;
                                return u.isValidElement(o) ? o : (t && rU && rm("fallback did not produce a valid ReactElement"), null)
                            }
                        }],
                        function(r, e) {
                            for (var t = 0; t < e.length; t++) {
                                var n = e[t];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(r, n.key, n)
                            }
                        }(t.prototype, e), t
                }(u.Component),
                r2 = function(r, e, t, n, a) {
                    (0, ra.render)((0, c.jsx)(r0, {
                        fallback: n,
                        onError: a,
                        children: r
                    }), e, t)
                },
                r1 = new g.QueryClient({
                    defaultOptions: {
                        queries: {
                            retry: !1,
                            refetchOnMount: !1,
                            refetchOnWindowFocus: !1,
                            refetchOnReconnect: !1
                        }
                    }
                });
            i(["Roblox", "core-scripts", "react"], e), i("ReactUtilities", function(r) {
                for (var e = 1; e < arguments.length; e++) {
                    var t = null != arguments[e] ? arguments[e] : {},
                        n = Object.keys(t);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(t).filter(function(r) {
                        return Object.getOwnPropertyDescriptor(t, r).enumerable
                    }))), n.forEach(function(e) {
                        var n;
                        n = t[e], e in r ? Object.defineProperty(r, e, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[e] = n
                    })
                }
                return r
            }({}, n))
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ReactUtilities");
//# debugId=f9da5aa3-037d-4f8b-aae1-71cb226803b6
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/reactUtilities-8fde2d4afbaae60f.js.map