local SegmentMetricsModule = require("./segment_metrics")
local _ = require("../vendor/compose/core")
local ThemeIconsModule = require("./theme_icons")
local _ = require("./theme_types")
local _ = require("./engine_types")
local ThemeDistanceModule = require("./theme_distance")
local ThemeSupportModule = require("./theme_support")
local ThemeRuleKitModule = require("./theme_rule_kit")
local ThemeDefineModule = require("./theme_define")
local ThemeStylesheetModule = require("./theme_stylesheet")
local ThemeSkinModule = require("./theme_skin")
local ContrastFunction = ThemeSupportModule.contrast
local CopyFunction = ThemeSupportModule.copy
local config = {
	SCHEMA = "facet-theme/2",
	TYPE_ROLES = table.freeze({
		"caption", "label", "body", "heading", "title", "control", "strong", "numeral"
	})
}
config.REQUIRED_TYPE_ROLES = config.TYPE_ROLES
local config1 = {
	surface = "content",
	surfaceStrong = "content",
	control = "content",
	contentStrong = "surface",
	accent = "onAccent",
	success = "onSuccess",
	warning = "onWarning",
	danger = "onDanger"
}
table.freeze(config1)

local function _(p1: number, p2: number, p3: number)
	return { r = p1 / 255, g = p2 / 255, b = p3 / 255 }
end

local config2 = {
	schema = config.SCHEMA,
	identity = {
		id = "facet-neutral",
		displayName = "Facet Neutral",
		version = "2.0.0",
		schemaVersion = config.SCHEMA
	},
	style = {
		defaultTheme = "Dark",
		themes = {
			{
				name = "Dark",
				colors = {
					surface = {
						r = 0.07058823529411765,
						g = 0.0784313725490196,
						b = 0.10196078431372549
					},
					surfaceStrong = {
						r = 0.10980392156862745,
						g = 0.12156862745098039,
						b = 0.1568627450980392
					},
					content = {
						r = 0.9254901960784314,
						g = 0.9372549019607843,
						b = 0.9607843137254902
					},
					contentStrong = {
						r = 0.9803921568627451,
						g = 0.984313725490196,
						b = 0.9921568627450981
					},
					accent = {
						r = 0.17254901960784313,
						g = 0.3843137254901961,
						b = 0.8235294117647058
					},
					onAccent = { r = 1, g = 1, b = 1 },
					danger = {
						r = 0.6901960784313725,
						g = 0.16470588235294117,
						b = 0.16470588235294117
					},
					onDanger = { r = 1, g = 1, b = 1 },
					success = {
						r = 0.11372549019607843,
						g = 0.47843137254901963,
						b = 0.25882352941176473
					},
					onSuccess = { r = 1, g = 1, b = 1 },
					warning = {
						r = 0.8313725490196079,
						g = 0.6039215686274509,
						b = 0.10980392156862745
					},
					onWarning = {
						r = 0.10196078431372549,
						g = 0.0784313725490196,
						b = 0.023529411764705882
					}
				},
				extra = {
					hairlineOpacity = 0.92,
					disabledContentOpacity = 0.4,
					scrimOpacity = 0.45,
					control = {
						r = 0.1607843137254902,
						g = 0.17647058823529413,
						b = 0.22745098039215686
					},
					controlHover = {
						r = 0.19215686274509805,
						g = 0.21176470588235294,
						b = 0.27058823529411763
					},
					controlPressed = {
						r = 0.13333333333333333,
						g = 0.1450980392156863,
						b = 0.18823529411764706
					},
					controlSelected = {
						r = 0.17647058823529413,
						g = 0.22745098039215686,
						b = 0.3607843137254902
					},
					contentSecondary = {
						r = 0.6196078431372549,
						g = 0.6470588235294118,
						b = 0.7137254901960784
					},
					hairline = { r = 1, g = 1, b = 1 }
				}
			},
			{
				name = "Light",
				colors = {
					surface = {
						r = 0.9490196078431372,
						g = 0.9568627450980393,
						b = 0.9725490196078431
					},
					surfaceStrong = { r = 1, g = 1, b = 1 },
					content = {
						r = 0.10980392156862745,
						g = 0.12549019607843137,
						b = 0.1607843137254902
					},
					contentStrong = {
						r = 0.047058823529411764,
						g = 0.054901960784313725,
						b = 0.0784313725490196
					},
					accent = {
						r = 0.13333333333333333,
						g = 0.3215686274509804,
						b = 0.7294117647058823
					},
					onAccent = { r = 1, g = 1, b = 1 },
					danger = {
						r = 0.7254901960784313,
						g = 0.10980392156862745,
						b = 0.10980392156862745
					},
					onDanger = { r = 1, g = 1, b = 1 },
					success = {
						r = 0.08235294117647059,
						g = 0.4196078431372549,
						b = 0.22745098039215686
					},
					onSuccess = { r = 1, g = 1, b = 1 },
					warning = {
						r = 0.8784313725490196,
						g = 0.6509803921568628,
						b = 0.12549019607843137
					},
					onWarning = {
						r = 0.10980392156862745,
						g = 0.08627450980392157,
						b = 0.023529411764705882
					}
				},
				extra = {
					hairlineOpacity = 0.92,
					disabledContentOpacity = 0.4,
					scrimOpacity = 0.45,
					control = {
						r = 0.8941176470588236,
						g = 0.9058823529411765,
						b = 0.9333333333333333
					},
					controlHover = {
						r = 0.8588235294117647,
						g = 0.8745098039215686,
						b = 0.9137254901960784
					},
					controlPressed = {
						r = 0.807843137254902,
						g = 0.8274509803921568,
						b = 0.8784313725490196
					},
					controlSelected = {
						r = 0.803921568627451,
						g = 0.8588235294117647,
						b = 0.9607843137254902
					},
					contentSecondary = {
						r = 0.35294117647058826,
						g = 0.3843137254901961,
						b = 0.4470588235294118
					},
					hairline = {
						r = 0.0392156862745098,
						g = 0.047058823529411764,
						b = 0.07058823529411765
					}
				}
			}
		}
	},
	metrics = {
		typography = {},
		space = {
			xs = 4,
			s = 8,
			m = 16,
			l = 24,
			xl = 40,
			tight = 6,
			gutter = 8
		},
		radii = { control = 8, panel = 12, pill = 999, tab = 999 },
		strokes = { hairline = 1 },
		targetSizes = { minimum = 44, inline = 24, thumb = 70, thumbLarge = 120 },
		controlSizes = {
			compact = { height = 36, paddingX = 8, iconSize = 16 },
			regular = { height = 44, paddingX = 12, iconSize = 20 },
			large = { height = 56, paddingX = 16, iconSize = 24 }
		},
		motion = {
			fast = 0.12,
			normal = 0.2,
			press = 0.08,
			hover = 0.15,
			reducedFade = 0.15,
			revealFadeShare = 0.5,
			presentFadeIn = 0.6,
			presentFadeOut = 0.5,
			unfoldStart = 0.25,
			restLimit = 0.25,
			frameLimit = 0,
			typewriter = { grapheme = 0.035, pause = 0 },
			popover = { enter = 0.15, exit = 0.1 },
			menu = { enter = 0.08, exit = 0.04 },
			dialog = { enter = 0.2, exit = 0.15 },
			reveal = { enter = 0.25, exit = 0.2 },
			sheet = { enter = 0.3, exit = 0.2 },
			toast = { enter = 0.2, exit = 0.2 },
			radial = { enter = 0.2, exit = 0.12, slot = 0.16 },
			durations = {
				cameraTravel = 0.3,
				cameraInertia = 0.22,
				pressLift = 0.1,
				zoom = 0.22,
				zoomPresent = 0.3,
				tabChrome = 0.3,
				travel = 0.3,
				travelFade = 0.16,
				travelStagger = 0.045,
				sequence = 0.3,
				countUp = 0.3,
				shake = 0.3,
				tabFade = 0.2,
				pageTurn = 0.65,
				popoverSheetExit = 0.2,
				rowDeparture = 0.24,
				rowArrival = 0.24,
				cardFade = 0.15,
				regionPop = 0.15,
				fieldReject = 0.24,
				buttonPop = 0.45,
				scrollReveal = 0.25,
				focusPulse = 1,
				busyLoop = 1,
				progressLoop = 1,
				spinnerLoop = 1.4,
				glide = 0.22,
				trailDelay = 0.3,
				trailSettle = 0.35
			},
			springs = {
				camera = { period = 0.3, damping = 1 },
				snappy = { period = 0.2, damping = 1 },
				quick = { period = 0.18, damping = 1 },
				travel = { period = 0.18, damping = 1 },
				control = { period = 0.25, damping = 1 },
				move = { period = 0.3, damping = 1 },
				sheet = { period = 0.4, damping = 1 },
				flick = { period = 0.3, damping = 0.8 }
			},
			materialize = {
				anchored = 0.9,
				menu = 0.96,
				modal = 0.94,
				branch = 0.3,
				lift = 1.04,
				radialSpread = 0.2,
				popOvershoot = 0.25,
				popDecay = 3,
				shakeCycles = 3,
				zoom = 0.92
			},
			scales = { travelLift = 1.08 },
			distances = {
				menuSlide = 32,
				parallax = 0.3,
				dim = 0.1,
				travelArc = 48,
				shakeAngle = 6,
				rowArrival = 12
			},
			easing = {
				present = "outCubic",
				fade = "outQuad",
				trail = "linear",
				zoom = "outCubic",
				zoomFade = "outCubic",
				zoomScale = "outSine",
				travel = "outCubic",
				sequence = "outCubic",
				countUp = "outCubic",
				shake = "linear"
			},
			styles = {
				paint = "Quad",
				scroll = "Quad",
				page = "Cubic",
				fling = "Quint",
				pulse = "Sine"
			},
			fling = {
				friction = 3,
				maxSpeed = 4000,
				projection = 0.08,
				bounceSpeed = 800
			}
		},
		iconSizes = { small = 16, medium = 20, large = 24 },
		controls = {
			navigationBack = { swipeEdge = 24 },
			button = { captionStroke = 1.5, captionStrokeOpacity = 0.7 },
			tabBottomTrack = {
				height = 64,
				sideInset = 16,
				bottomInset = 12,
				radius = 20,
				contentGap = 8
			},
			tabRailTrack = {
				sideInset = 8,
				topInset = 8,
				bottomInset = 8,
				radius = 16
			},
			tabMark = { width = 20, height = 4, gap = 4, radius = 2 },
			tabRailSelection = { insetX = 8, insetY = 4, radius = 8 },
			zoom = {
				stepRatio = 1.25,
				panSpeed = 480,
				panStep = 48,
				doubleTapSeconds = 0.35,
				doubleTapDistance = 12
			},
			progress = {
				trackHeight = 6,
				minTrackWidth = 64,
				circularSize = 32,
				circularThickness = 3,
				spinnerDotSize = 4
			},
			image = { defaultSize = 48 },
			alert = { maxWidth = 560 },
			popup = { panelWidth = 360 },
			typography = { preferredSizeStep = 2, minimumSize = 14 },
			dialog = { wideWidth = 800 },
			snackbar = { maxWidth = 480 },
			radial = { narrow = 48, regular = 64, wide = 88 }
		}
	},
	chrome = {},
	assets = {},
	icons = {},
	rules = {}
}

for i, Size in {
	caption = 14,
	label = 15,
	body = 16,
	heading = 20,
	title = 24,
	control = 18,
	strong = 16,
	numeral = 18
} do
	config2.metrics.typography[i] = {
		lineHeight = 1.2,
		size = Size,
		font = {
			family = "BuilderSans",
			style = "Normal",
			weight = if i == "heading" or i == "title" or i == "numeral" then "Bold" elseif i == "strong" then "SemiBold" else "Regular"
		}
	}
end
function config.neutralPackage()
	-- upvalues: CopyFunction (copy), config2 (copy)
	return CopyFunction(config2)
end

local NewThemeDistance = ThemeDistanceModule.create(config2)
config.forDistance = NewThemeDistance.forDistance
config.forResolution = NewThemeDistance.forResolution
local ThemeDefineModuleResult = ThemeDefineModule(config2, config.SCHEMA, config.TYPE_ROLES)
config.define = ThemeDefineModuleResult.define
config.checkCoverage = ThemeDefineModuleResult.checkCoverage
config.resolveIcon = ThemeIconsModule
local config3 = {
	color = function(p1, p2)
		if type(p2) == "table" and p2.r ~= nil then
			return p1.Color3.new(p2.r, p2.g, p2.b)
		else
			assert(p2 == nil or typeof(p2) == "Color3")
			
			return p2
		end
	end,
	white = function(p1)
		return p1.Color3.new(1, 1, 1)
	end
}
local Inset = SegmentMetricsModule.inset

local function rulesFor(p1, p2, p3)
	-- upvalues: ThemeRuleKitModule (copy), config2 (copy), config3 (copy), config (copy), ContrastFunction (copy), config1 (copy), Inset (copy), ThemeSupportModule (copy)
	local ThemeRuleKitModuleResult = ThemeRuleKitModule(p1, p2, p3, config2, config3)
	local Extra = ThemeRuleKitModuleResult.extra
	local SourceFunction = ThemeRuleKitModuleResult.source
	local CFunction = ThemeRuleKitModuleResult.c
	local FFunction = ThemeRuleKitModuleResult.f
	local RuleFunction: (any, any) -> () = ThemeRuleKitModuleResult.rule
	local ResolvedFunction = ThemeRuleKitModuleResult.resolved
	RuleFunction("ScrollingFrame", {
		ScrollBarThickness = 4,
		ScrollBarImageTransparency = 0.4,
		VerticalScrollBarInset = p3.Enum.ScrollBarInset.Always,
		HorizontalScrollBarInset = p3.Enum.ScrollBarInset.ScrollBar,
		ScrollBarImageColor3 = CFunction("contentSecondary")
	})
	RuleFunction(".facet-layout", { BackgroundTransparency = 1 })
	local Materialize = p1.metrics.motion.materialize or {}
	local Materialize1 = config2.metrics.motion.materialize or {}
	RuleFunction(".facet-region-pop", { Scale = 1 })
	RuleFunction(".facet-region-pop#Rest", { Scale = Materialize.modal or (Materialize1.modal or 1) })
	RuleFunction(".facet-text", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		TextColor3 = CFunction("content"),
		FontFace = FFunction(p1.metrics.typography.body.font)
	})
	
	for _, tYPEROLE in config.TYPE_ROLES do
		local TypographyEntry = p1.metrics.typography[tYPEROLE] or config2.metrics.typography[tYPEROLE]
		RuleFunction(".facet-type-" .. tYPEROLE, {
			FontFace = FFunction(TypographyEntry.font),
			TextSize = TypographyEntry.size,
			LineHeight = TypographyEntry.lineHeight or 1.2,
			TextColor3 = if tYPEROLE == "caption" then CFunction("contentSecondary") else nil
		})
	end
	RuleFunction(".facet-badge.facet-type-caption, .facet-badge > .facet-type-caption, .facet-shortcut-hint >> .facet-type-caption", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-validation", {
		TextColor3 = CFunction("danger"),
		TextSize = p1.metrics.typography.caption.size
	})
	RuleFunction(".facet-secondary", { TextColor3 = CFunction("contentSecondary") })
	RuleFunction(".facet-tone-accent", { TextColor3 = CFunction("accent") })
	RuleFunction(".facet-tone-positive", { TextColor3 = CFunction("success") })
	RuleFunction(".facet-tone-warning", { TextColor3 = CFunction("warning") })
	RuleFunction(".facet-tone-negative", { TextColor3 = CFunction("danger") })
	RuleFunction(".facet-tone-muted", { TextColor3 = CFunction("contentSecondary") })
	RuleFunction("TextBox.facet-text", { PlaceholderColor3 = CFunction("contentSecondary") })
	RuleFunction(".facet-flash", { BackgroundColor3 = CFunction("accent") })
	RuleFunction(".facet-accent-text", { TextColor3 = CFunction("accent") })
	RuleFunction(".facet-strong", { TextColor3 = CFunction("contentStrong") })
	
	for _, value1 in {
		"surface", "panel", "control", "field", "button", "badge", "track", "skeleton",
		"avatar", "menu", "tab", "sheet"
	} do
		RuleFunction(".facet-" .. value1, {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = CFunction(if value1 == "surface" then "surface" elseif value1 == "panel" or value1 == "menu" or value1 == "sheet" then "surfaceStrong" else "control")
		})
		RuleFunction(".facet-" .. value1 .. "::UICorner", {
			CornerRadius = p3.UDim.new(0, if value1 == "panel" or value1 == "sheet" or value1 == "menu" then p1.metrics.radii.panel else p1.metrics.radii.control)
		})
	end
	RuleFunction(".facet-button", {
		TextColor3 = CFunction("content"),
		FontFace = FFunction(p1.metrics.typography.control.font),
		TextSize = p1.metrics.typography.control.size
	})
	
	for _, tYPEROLE1 in config.TYPE_ROLES do
		local TypographyEntry = p1.metrics.typography[tYPEROLE1] or config2.metrics.typography[tYPEROLE1]
		RuleFunction(".facet-button.facet-type-" .. tYPEROLE1, {
			FontFace = FFunction(TypographyEntry.font),
			TextSize = TypographyEntry.size
		})
	end
	for _, value3 in {
		"toggle", "toggle-indicator", "slider-rail", "slider-track", "chip",
		"shortcut-hint", "text-input"
	} do
		RuleFunction(".facet-" .. value3, {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = CFunction("control")
		})
	end
	RuleFunction(".facet-chip::UICorner", { CornerRadius = p3.UDim.new(0, p1.metrics.radii.pill) })
	
	for _, value4 in {
		"toggle-mark",
		"slider-fill",
		"slider-thumb",
		"selection-indicator"
	} do
		RuleFunction(".facet-" .. value4, {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = CFunction(if value4 == "slider-fill" or value4 == "selection-indicator" then "selection" else "accent")
		})
	end
	for i, value5 in {
		button = "control",
		field = "field",
		badge = "badge",
		panel = "panel",
		["control.facet-skinned"] = "control"
	} do
		local Chrome1 = p1.chrome
		local ChromeEntry = if Chrome1 then Chrome1[value5] else nil
		Chrome1 = if ChromeEntry then ChromeEntry.contentInsets or {} else {}
		local Regular = p1.metrics.controlSizes.regular
		local PaddingX = if i == "button" then if Regular then Regular.paddingX else 12 elseif i == "badge" then 8 elseif i == "panel" then p1.metrics.space.m else 0
		Regular = if i == "badge" then 3 elseif i == "panel" then p1.metrics.space.m else 0
		
		local function _(p4: number, p5)
			-- upvalues: p3 (copy), i (copy)
			return p3.UDim.new(0, if i == "badge" or i == "panel" then math.max(p4, p5 or 0) else p4 + (p5 or 0))
		end
		
		local Left = Chrome1.left
		local NewFunction = p3.UDim.new
		local v1 = 0
		local Largest = if i == "badge" or i == "panel" then math.max(PaddingX, Left or 0) else PaddingX + (Left or 0)
		Left = Chrome1.right
		NewFunction = p3.UDim.new
		v1 = 0
		local Largest1: number = if i == "badge" or i == "panel" then math.max(PaddingX, Left or 0) else PaddingX + (Left or 0)
		Left = Chrome1.top
		NewFunction = p3.UDim.new
		v1 = 0
		local Largest2 = if i == "badge" or i == "panel" then math.max(Regular, Left or 0) else Regular + (Left or 0)
		Left = Chrome1.bottom
		NewFunction = p3.UDim.new
		v1 = 0
		RuleFunction(".facet-" .. i .. "::UIPadding", {
			PaddingLeft = NewFunction(v1, Largest),
			PaddingRight = NewFunction(v1, Largest1),
			PaddingTop = NewFunction(v1, Largest2),
			PaddingBottom = NewFunction(v1, if i == "badge" or i == "panel" then math.max(Regular, Left or 0) else Regular + (Left or 0))
		})
	end
	local Chrome = p1.chrome or {}
	local Control = Chrome.control
	local ContentInsets = if Control then Control.contentInsets or {} else {}
	RuleFunction(".facet-sheet >> .facet-card-body, .facet-panel >> .facet-card-body", { BackgroundColor3 = CFunction("control") })
	RuleFunction(".facet-sheet >> .facet-card-text, .facet-panel >> .facet-card-text", { BackgroundColor3 = CFunction("control") })
	RuleFunction(".facet-card-text >> .facet-card-text", { BackgroundColor3 = CFunction("surfaceStrong") })
	RuleFunction(".facet-sheet >> .facet-card-text >> .facet-card-text, .facet-panel >> .facet-card-text >> .facet-card-text", { BackgroundColor3 = CFunction("control") })
	RuleFunction(".facet-card-text >> .facet-card-body, .facet-card-text >> .facet-card-inflow", { BackgroundTransparency = 1 })
	RuleFunction(".facet-card-text::UIPadding", {
		PaddingBottom = p3.UDim.new(0, p1.metrics.space.s),
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0),
		PaddingTop = p3.UDim.new(0, 0)
	})
	RuleFunction(".facet-panel.facet-card-body::UIPadding, .facet-panel.facet-card-body > UIPadding, .facet-panel.facet-dialog::UIPadding, .facet-panel.facet-dialog > UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0),
		PaddingTop = p3.UDim.new(0, 0),
		PaddingBottom = p3.UDim.new(0, 0)
	})
	
	for _, value6 in {
		{ "tablehead", "tableHeader" },
		{ "tablerow", "tableRow" },
		{ "tablerow-alternate", "tableRowAlternate" }
	} do
		RuleFunction(".facet-" .. value6[1], {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = CFunction(value6[2])
		})
	end
	for _, value7 in { "tablehead", "tablerow" } do
		RuleFunction(".facet-" .. value7 .. "::UICorner", { CornerRadius = p3.UDim.new(0, p1.metrics.radii.control) })
	end
	for _, value in { "tablerow", "row-action" } do
		RuleFunction(".facet-" .. value .. "::UIStroke", {
			Thickness = 1,
			Transparency = 0,
			Color = CFunction("surface"),
			BorderStrokePosition = p3.Enum.BorderStrokePosition.Inner
		})
	end
	RuleFunction(".facet-tableheading", { BackgroundTransparency = 1 })
	
	local function rungMetric(Regular, p4)
		-- upvalues: p1 (copy), config2 (upval), rungMetric (copy)
		local ControlSizes = p1.metrics.controlSizes
		local ControlSize = if ControlSizes then ControlSizes[Regular] else nil
		local Height = if ControlSize then if p4 == "height" then ControlSize.height elseif p4 == "paddingX" then ControlSize.paddingX else ControlSize.iconSize else nil
		
		if type(Height) == "number" then
			return Height
		else
			local ControlSize1 = config2.metrics.controlSizes[Regular]
			
			return if ControlSize1 then if p4 == "height" then ControlSize1.height elseif p4 == "paddingX" then ControlSize1.paddingX else ControlSize1.iconSize else math.max(0, rungMetric("compact", p4) * 2 - rungMetric("regular", p4))
		end
	end
	
	local Floored = math.floor(rungMetric("regular", "height") / 2 + 0.5)
	RuleFunction(".facet-button.facet-chip::UIPadding", {
		PaddingLeft = p3.UDim.new(0, Floored + (ContentInsets.left or 0)),
		PaddingRight = p3.UDim.new(0, Floored + (ContentInsets.right or 0))
	})
	
	for _, value2 in { "xsmall", "compact", "regular", "large" } do
		local PaddingX = rungMetric(value2, "paddingX")
		RuleFunction(".facet-button.facet-size-" .. value2 .. "::UIPadding", {
			PaddingLeft = p3.UDim.new(0, PaddingX + (ContentInsets.left or 0)),
			PaddingRight = p3.UDim.new(0, PaddingX + (ContentInsets.right or 0))
		})
	end
	RuleFunction(".facet-button-tight::UIPadding", {
		PaddingLeft = p3.UDim.new(0, ContentInsets.left or 0),
		PaddingRight = p3.UDim.new(0, ContentInsets.right or 0)
	})
	local v2 = 12 + (ContentInsets.left or 0)
	local v3 = 12 + (ContentInsets.right or 0)
	
	for _, value8 in { "tablevalue", "tableheading" } do
		RuleFunction(".facet-" .. value8 .. "::UIPadding", {
			PaddingLeft = p3.UDim.new(0, v2),
			PaddingRight = p3.UDim.new(0, v3)
		})
	end
	RuleFunction(".facet-tablecellinset", {
		Position = p3.UDim2.fromOffset(v2, 0),
		Size = p3.UDim2.new(1, -(v2 + v3), 1, 0)
	})
	RuleFunction(".facet-button.facet-button-glyph::UIPadding", {
		PaddingLeft = p3.UDim.new(0, ContentInsets.left or 0),
		PaddingRight = p3.UDim.new(0, ContentInsets.right or 0)
	})
	RuleFunction(".facet-button-glyph.facet-appearance-utility::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0),
		PaddingTop = p3.UDim.new(0, 0),
		PaddingBottom = p3.UDim.new(0, 0)
	})
	RuleFunction(".facet-disclosure::UIPadding", {
		PaddingRight = p3.UDim.new(0, 32 + (ContentInsets.right or 0))
	})
	RuleFunction(".facet-menu-mark::UIPadding", {
		PaddingRight = p3.UDim.new(0, rungMetric("regular", "paddingX") + 8 + rungMetric("regular", "iconSize") + (ContentInsets.right or 0))
	})
	RuleFunction(".facet-button-described::UIPadding", {
		PaddingTop = p3.UDim.new(0, 10 + (ContentInsets.top or 0)),
		PaddingBottom = p3.UDim.new(0, 10 + (ContentInsets.bottom or 0))
	})
	RuleFunction(".facet-toggle-row::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0)
	})
	RuleFunction(".facet-toggle-settings::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 12 + (ContentInsets.left or 0)),
		PaddingRight = p3.UDim.new(0, 12 + (ContentInsets.right or 0))
	})
	RuleFunction(".facet-slider-settings::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 12 + (ContentInsets.left or 0)),
		PaddingRight = p3.UDim.new(0, 12 + (ContentInsets.right or 0))
	})
	local Xs = (p1.metrics.space or config2.metrics.space).xs or config2.metrics.space.xs
	RuleFunction(".facet-calendar-choice::UIPadding", {
		PaddingLeft = p3.UDim.new(0, Xs),
		PaddingRight = p3.UDim.new(0, Xs)
	})
	
	for _, value9 in {
		"",
		"xsmall",
		"compact",
		"regular",
		"large"
	} do
		local Regular = if value9 == "" then "regular" else value9
		local PaddingX = rungMetric(Regular, "paddingX")
		local Largest = math.max(0, (rungMetric(Regular, "height") - rungMetric(Regular, "iconSize") - Xs) // 2)
		RuleFunction(".facet-list-row" .. (if value9 == "" then "" else ".facet-size-" .. value9) .. "::UIPadding", {
			PaddingLeft = p3.UDim.new(0, PaddingX + (ContentInsets.left or 0)),
			PaddingRight = p3.UDim.new(0, PaddingX + (ContentInsets.right or 0)),
			PaddingTop = p3.UDim.new(0, (math.max(Largest, ContentInsets.top or 0))),
			PaddingBottom = p3.UDim.new(0, (math.max(Largest, ContentInsets.bottom or 0)))
		})
	end
	RuleFunction(".facet-menu-dense::UIPadding", {
		PaddingTop = p3.UDim.new(0, 0),
		PaddingBottom = p3.UDim.new(0, 0)
	})
	RuleFunction(".facet-busy::UIPadding", {
		PaddingRight = p3.UDim.new(0, 32 + (ContentInsets.right or 0))
	})
	RuleFunction(".facet-shape-circle::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0),
		PaddingTop = p3.UDim.new(0, 0),
		PaddingBottom = p3.UDim.new(0, 0)
	})
	RuleFunction(".facet-button-media::UIPadding", {
		PaddingLeft = p3.UDim.new(0, ContentInsets.left or 0),
		PaddingRight = p3.UDim.new(0, ContentInsets.right or 0),
		PaddingTop = p3.UDim.new(0, ContentInsets.top or 0),
		PaddingBottom = p3.UDim.new(0, 10 + (ContentInsets.bottom or 0))
	})
	RuleFunction(".facet-button-media-body::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 12),
		PaddingRight = p3.UDim.new(0, 12)
	})
	RuleFunction(".facet-button-captioned", { TextTransparency = 1 })
	RuleFunction(".facet-badge-captioned", { TextTransparency = 1 })
	RuleFunction(".facet-badge-caption", { TextTransparency = 0 })
	RuleFunction(".facet-button-caption", {
		TextTransparency = 0,
		TextColor3 = CFunction("content"),
		FontFace = FFunction(p1.metrics.typography.control.font),
		TextSize = p1.metrics.typography.control.size
	})
	RuleFunction(".facet-accent >> .facet-button-caption", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-disabled >> .facet-button-caption", { TextTransparency = Extra.disabledContentOpacity })
	RuleFunction(".facet-disabled >> .facet-text", { TextTransparency = Extra.disabledContentOpacity })
	RuleFunction(".facet-skin-caption > Frame > Frame > .facet-button-caption", { TextTransparency = 1 })
	RuleFunction(".facet-skin-caption-text", {
		TextTransparency = 0,
		BackgroundTransparency = 1,
		TextColor3 = CFunction("content"),
		FontFace = FFunction(p1.metrics.typography.control.font),
		TextSize = p1.metrics.typography.control.size
	})
	RuleFunction(".facet-button:Hover", { BackgroundColor3 = CFunction("controlHover") })
	RuleFunction(".facet-button:Press", { BackgroundColor3 = CFunction("controlPressed") })
	RuleFunction(".facet-role-destructive", {
		BackgroundColor3 = CFunction("danger"),
		TextColor3 = CFunction("onDanger")
	})
	RuleFunction(".facet-role-destructive:Hover", { BackgroundColor3 = CFunction("danger") })
	RuleFunction(".facet-role-destructive:Press", { BackgroundColor3 = CFunction("danger") })
	RuleFunction(".facet-role-destructive >> .facet-button-caption", { TextColor3 = CFunction("onDanger") })
	RuleFunction(".facet-role-cancel", { TextColor3 = CFunction("contentSecondary") })
	RuleFunction(".facet-role-cancel >> .facet-button-caption", { TextColor3 = CFunction("contentSecondary") })
	RuleFunction(".facet-role-onIndicator >> .facet-button-caption", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-role-destructive >> .facet-text", { TextColor3 = CFunction("onDanger") })
	local OnSelected = CFunction("onSelected") or CFunction("content")
	RuleFunction(".facet-selected", {
		BackgroundColor3 = CFunction("controlSelected"),
		TextColor3 = OnSelected
	})
	RuleFunction(".facet-selected >> .facet-text", { TextColor3 = OnSelected })
	RuleFunction(".facet-selected >> .facet-card-part, .facet-selected >> .facet-card-text", { BackgroundColor3 = CFunction("controlSelected") })
	RuleFunction(".facet-disabled", { TextTransparency = Extra.disabledContentOpacity })
	RuleFunction(".facet-disabled >> .facet-icon", { ImageTransparency = Extra.disabledContentOpacity })
	RuleFunction(".facet-drag-held", { TextTransparency = 1 })
	RuleFunction(".facet-drag-held >> .facet-text", { TextTransparency = 1 })
	RuleFunction(".facet-drag-held >> .facet-icon", { ImageTransparency = 1 })
	RuleFunction(".facet-accent", {
		BackgroundColor3 = CFunction("accent"),
		TextColor3 = CFunction("onAccent")
	})
	RuleFunction(".facet-fill", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("accent")
	})
	RuleFunction(".facet-track >> .facet-fill::UICorner", { CornerRadius = p3.UDim.new(0, p1.metrics.radii.control) })
	RuleFunction(".facet-level-segment", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("control")
	})
	RuleFunction(".facet-level-on", { BackgroundColor3 = CFunction("accent") })
	RuleFunction(".facet-progress-ring-track", { Color3 = CFunction("control") })
	RuleFunction(".facet-path", { Color3 = CFunction("content") })
	RuleFunction(".facet-path-content", { Color3 = CFunction("content") })
	RuleFunction(".facet-path-secondary", { Color3 = CFunction("contentSecondary") })
	RuleFunction(".facet-path-accent", { Color3 = CFunction("accent") })
	RuleFunction(".facet-accent >> .facet-button-glyph >> .facet-path", { Color3 = CFunction("onAccent") })
	RuleFunction(".facet-selected >> .facet-button-glyph >> .facet-path", { Color3 = OnSelected })
	RuleFunction(".facet-role-destructive >> .facet-button-glyph >> .facet-path", { Color3 = CFunction("onDanger") })
	RuleFunction(".facet-role-cancel >> .facet-button-glyph >> .facet-path", { Color3 = CFunction("contentSecondary") })
	RuleFunction(".facet-role-onIndicator >> .facet-button-glyph >> .facet-path", { Color3 = CFunction("onAccent") })
	RuleFunction(".facet-disabled >> .facet-button-glyph >> .facet-path", { Color3 = CFunction("contentSecondary") })
	RuleFunction(".facet-progress-ring-fill", { Color3 = CFunction("accent") })
	
	for _, value10 in { "accent", "success", "warning", "danger" } do
		local Text = ".facet-progress-role-" .. value10
		RuleFunction(Text .. " >> .facet-fill", { BackgroundColor3 = CFunction(value10) })
		RuleFunction(Text .. " >> .facet-progress-ring-fill", { Color3 = CFunction(value10) })
	end
	RuleFunction(".facet-progress-gauge-needle", { Color3 = CFunction("content") })
	RuleFunction(".facet-progress-gauge-hub", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("content")
	})
	RuleFunction(".facet-icon", {
		BackgroundTransparency = 1,
		ImageColor3 = CFunction("content")
	})
	RuleFunction(".facet-role-destructive >> .facet-icon", { ImageColor3 = CFunction("onDanger") })
	RuleFunction(".facet-selected >> .facet-icon", { ImageColor3 = OnSelected })
	RuleFunction(".facet-divider", {
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("hairline"),
		BackgroundTransparency = Extra.hairlineOpacity
	})
	RuleFunction(".facet-divider-strong", {
		BackgroundTransparency = Extra.strongHairlineOpacity or math.max(0, 1 - (1 - (Extra.hairlineOpacity or 0.92)) * 3)
	})
	RuleFunction(".facet-pane", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("surfaceStrong")
	})
	local v4 = ".facet-scrim"
	local config4 = { BorderSizePixel = 0 }
	local Scrim = Extra.scrim
	local NewResult = nil
	
	if type(Scrim) == "table" and Scrim.r ~= nil then
		NewResult = p3.Color3.new(Scrim.r, Scrim.g, Scrim.b)
	else
		assert(Scrim == nil or typeof(Scrim) == "Color3")
		NewResult = Scrim
	end
	if not NewResult then
		NewResult = p3.Color3.new(0, 0, 0)
	end
	config4.BackgroundColor3 = NewResult
	config4.BackgroundTransparency = 1 - (Extra.scrimOpacity or 0.45)
	RuleFunction(v4, config4)
	RuleFunction(".facet-scrim.facet-radial-scrim", {
		BackgroundColor3 = p3.Color3.new(0, 0, 0),
		BackgroundTransparency = 1 - math.max(Extra.scrimOpacity or 0.45, 0.8)
	})
	local config5 = {
		neutral = "contentSecondary",
		info = "accent",
		success = "success",
		warning = "warning",
		error = "danger",
		accent = "accent",
		voice = "voice",
		contrast = "contentStrong"
	}
	
	local _ = function(p4): string
		return if p4 == "neutral" then "surface" elseif p4 == "error" then "onDanger" elseif p4 == "info" or p4 == "accent" then "onAccent" elseif p4 == "warning" or p4 == "voice" then "onWarning" elseif p4 == "contrast" then "surface" else "onSuccess"
	end
	
	for i2, value11 in config5 do
		local Surface: string = if i2 == "neutral" then "surface" elseif i2 == "error" then "onDanger" elseif i2 == "info" or i2 == "accent" then "onAccent" elseif i2 == "warning" or i2 == "voice" then "onWarning" elseif i2 == "contrast" then "surface" else "onSuccess"
		RuleFunction(".facet-status-" .. i2, {
			BackgroundColor3 = CFunction(value11),
			TextColor3 = CFunction(Surface)
		})
		RuleFunction(".facet-status-" .. i2 .. " > .facet-status-ring", { Color = CFunction(value11) })
		RuleFunction(".facet-icon-" .. i2, {
			BackgroundTransparency = 1,
			ImageColor3 = CFunction(value11)
		})
		RuleFunction(".facet-status-" .. i2 .. " > .facet-text", { TextColor3 = CFunction(Surface) })
		RuleFunction(".facet-status-" .. i2 .. " > .facet-icon", { ImageColor3 = CFunction(Surface) })
	end
	RuleFunction(".facet-status-surface", { BackgroundTransparency = 0 })
	RuleFunction(".facet-status-surface >> .facet-track", { BackgroundTransparency = 0.7 })
	
	for i3 in config5 do
		local Callback = CFunction
		Callback = Callback(if i3 == "neutral" then "surface" elseif i3 == "error" then "onDanger" elseif i3 == "info" or i3 == "accent" then "onAccent" elseif i3 == "warning" or i3 == "voice" then "onWarning" elseif i3 == "contrast" then "surface" else "onSuccess")
		local Text = ".facet-status-surface.facet-status-" .. i3
		RuleFunction(`{Text} >> .facet-text, {Text} >> .facet-icon`, { TextColor3 = Callback, ImageColor3 = Callback })
		RuleFunction(`{Text} >> .facet-fill, {Text} >> .facet-track`, { BackgroundColor3 = Callback })
	end
	RuleFunction(".facet-badge-on-media::UIStroke", { Thickness = 1, Transparency = 0.5 })
	
	for i1 in config5 do
		RuleFunction(".facet-badge-on-media.facet-status-" .. i1 .. "::UIStroke", {
			Color = CFunction(if i1 == "neutral" then "surface" elseif i1 == "error" then "onDanger" elseif i1 == "info" or i1 == "accent" then "onAccent" elseif i1 == "warning" or i1 == "voice" then "onWarning" elseif i1 == "contrast" then "surface" else "onSuccess")
		})
	end
	RuleFunction(".facet-status-hollow", { BackgroundTransparency = 1 })
	RuleFunction(".facet-badge-utility", {
		BackgroundTransparency = 1,
		TextColor3 = CFunction("contentSecondary")
	})
	RuleFunction(".facet-badge-utility > .facet-text", { TextColor3 = CFunction("contentSecondary") })
	RuleFunction(".facet-badge-utility > .facet-icon", { ImageColor3 = CFunction("contentSecondary") })
	RuleFunction(".facet-badge-status", {
		BackgroundColor3 = CFunction("control"),
		TextColor3 = CFunction("content")
	})
	RuleFunction(".facet-badge-status > .facet-text", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-badge-status > .facet-icon", { ImageColor3 = CFunction("content") })
	RuleFunction(".facet-badge-status::UIPadding", { PaddingLeft = p3.UDim.new(0, 20) })
	RuleFunction(".facet-cutout", { Color = CFunction("surface") })
	local ChromeGradient = Extra.chromeGradient or {}
	for i4, value12 in ChromeGradient do
		local List1 = {}
		local List2 = {}
		
		for _, stop in value12.stops do
			table.insert(List1, p3.ColorSequenceKeypoint.new(stop.t, p3.Color3.new(stop.r, stop.g, stop.b)))
		end
		local Alpha = value12.alpha or {}
		for _, value13 in Alpha do
			table.insert(List2, p3.NumberSequenceKeypoint.new(value13.t, value13.v))
		end
		if #List1 >= 2 then
			local config6 = {
				Color = p3.ColorSequence.new(List1),
				Rotation = value12.rotation or 90
			}
			
			if #List2 >= 2 then
				config6.Transparency = p3.NumberSequence.new(List2)
			end
			RuleFunction(".facet-" .. i4 .. "::UIGradient", config6)
			RuleFunction(".facet-status-surface.facet-" .. i4 .. "::UIGradient", {
				Color = p3.ColorSequence.new(p3.Color3.new(1, 1, 1)),
				Transparency = p3.NumberSequence.new(0)
			})
		end
	end
	RuleFunction(".facet-shortcut-hint", {
		BackgroundColor3 = CFunction("surfaceStrong"),
		TextColor3 = CFunction("contentStrong"),
		TextSize = p1.metrics.typography.caption.size
	})
	RuleFunction(".facet-shortcut-glyph", { ImageColor3 = CFunction("contentStrong") })
	RuleFunction(".facet-shortcut-hint::UICorner", {
		CornerRadius = p3.UDim.new(0, (math.min(6, p1.metrics.radii.control)))
	})
	local Controls = p1.metrics.controls or {}
	local CapStroke = (Controls.shortcutHint or {}).capStroke or (p1.metrics.strokes.hairline or 1)
	
	if CapStroke > 0 then
		RuleFunction(".facet-shortcut-hint::UIStroke", {
			Color = CFunction("hairline"),
			Transparency = Extra.hairlineOpacity or 0.92,
			Thickness = CapStroke,
			ApplyStrokeMode = p3.Enum.ApplyStrokeMode.Border
		})
	end
	RuleFunction(".facet-shortcut-hint::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 8),
		PaddingRight = p3.UDim.new(0, 8)
	})
	RuleFunction(".facet-shortcut-hint.facet-shortcut-hint-bare::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0)
	})
	RuleFunction(".facet-shortcut-hint.facet-shortcut-hint-bare::UIStroke", { Transparency = 1 })
	RuleFunction(".facet-toggle-row", { BackgroundTransparency = 1 })
	RuleFunction(".facet-toggle-row:Hover", { BackgroundTransparency = 1 })
	RuleFunction(".facet-toggle-row:Press", { BackgroundTransparency = 1 })
	RuleFunction(".facet-toggle-row.facet-selected", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-toggle-row.facet-selected >> .facet-text", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-toggle-row.facet-selected >> .facet-icon", { ImageColor3 = CFunction("content") })
	RuleFunction(".facet-toggle-plain", { BackgroundTransparency = 1 })
	RuleFunction(".facet-toggle-indicator", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("control")
	})
	RuleFunction(".facet-toggle-on", { BackgroundColor3 = CFunction("selection") })
	local BackgroundColor3 = assert(ResolvedFunction("onSelection"))
	local v5 = assert(ResolvedFunction("control"))
	local v6 = assert(ResolvedFunction("content"))
	RuleFunction(".facet-toggle-switch >> .facet-toggle-mark", {
		BackgroundColor3 = if ContrastFunction(BackgroundColor3, v5) >= 3 or ContrastFunction(v6, v5) <= ContrastFunction(BackgroundColor3, v5) then BackgroundColor3 else v6
	})
	RuleFunction(".facet-toggle-checkbox >> .facet-toggle-mark", { BackgroundColor3 = BackgroundColor3 })
	RuleFunction(".facet-toggle-on >> .facet-toggle-mark", { BackgroundColor3 = BackgroundColor3 })
	RuleFunction(".facet-toggle-check", { ImageColor3 = CFunction("onSelection") })
	RuleFunction(".facet-toggle-checkbox::UIStroke", {
		Thickness = 1.5,
		Transparency = 0.2,
		Color = CFunction("contentSecondary")
	})
	RuleFunction(".facet-toggle-switch::UIStroke", {
		Thickness = 1,
		Transparency = 0.2,
		Color = if ContrastFunction(v5, assert(ResolvedFunction("surface"))) < 1.5 then CFunction("contentSecondary") else CFunction("control")
	})
	RuleFunction(".facet-toggle-switch.facet-toggle-on::UIStroke", { Color = CFunction("selection") })
	local DisabledContentOpacity = Extra.disabledContentOpacity or 0.4
	RuleFunction(".facet-disabled >> .facet-toggle-indicator", { BackgroundTransparency = DisabledContentOpacity })
	RuleFunction(".facet-disabled >> .facet-toggle-mark", { BackgroundTransparency = DisabledContentOpacity })
	RuleFunction(".facet-disabled >> .facet-toggle-check", { ImageTransparency = DisabledContentOpacity })
	RuleFunction(".facet-disabled >> .facet-toggle-checkbox::UIStroke", { Transparency = math.max(0.2, DisabledContentOpacity) })
	RuleFunction(".facet-disabled >> .facet-toggle-switch::UIStroke", { Transparency = math.max(0.2, DisabledContentOpacity) })
	RuleFunction(".facet-tooltip", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("surfaceStrong")
	})
	RuleFunction(".facet-tooltip::UICorner", {
		CornerRadius = p3.UDim.new(0, (math.min(6, p1.metrics.radii.control)))
	})
	RuleFunction(".facet-tooltip::UIStroke", {
		Transparency = 0.4,
		Thickness = 1,
		Color = CFunction("hairline")
	})
	RuleFunction(".facet-appearance-utility", { BackgroundTransparency = 1 })
	RuleFunction(".facet-appearance-utility:Hover", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlHover")
	})
	RuleFunction(".facet-appearance-utility:Press", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlPressed")
	})
	local TextColor3 = (function(p4)
		-- upvalues: ResolvedFunction (copy), p3 (copy), ContrastFunction (upval), CFunction (copy)
		local v7 = assert(ResolvedFunction("accent"))
		
		for _, value in { "surface", "surfaceStrong" } do
			local ResolvedResult = ResolvedFunction(value)
			
			if ResolvedResult and ContrastFunction(v7, (p3.Color3.new(ResolvedResult.R + (v7.R - ResolvedResult.R) * p4, ResolvedResult.G + (v7.G - ResolvedResult.G) * p4, ResolvedResult.B + (v7.B - ResolvedResult.B) * p4))) < 4.5 then
				return CFunction("content")
			end
		end
		return CFunction("accent")
	end)(0.2)
	RuleFunction(".facet-appearance-soft", {
		BackgroundTransparency = 0.8,
		BackgroundColor3 = CFunction("accent"),
		TextColor3 = TextColor3
	})
	RuleFunction(".facet-appearance-soft:Hover", {
		BackgroundTransparency = 0.7,
		BackgroundColor3 = CFunction("accent")
	})
	RuleFunction(".facet-appearance-soft:Press", {
		BackgroundTransparency = 0.6,
		BackgroundColor3 = CFunction("accent")
	})
	RuleFunction(".facet-appearance-soft >> .facet-button-caption", { TextColor3 = TextColor3 })
	RuleFunction(".facet-appearance-soft >> .facet-icon", { ImageColor3 = TextColor3 })
	RuleFunction(".facet-appearance-soft.facet-selected", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("accent"),
		TextColor3 = CFunction("onAccent")
	})
	RuleFunction(".facet-appearance-soft.facet-selected >> .facet-button-caption", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-appearance-soft.facet-selected >> .facet-icon", { ImageColor3 = CFunction("onAccent") })
	local Accent = if ContrastFunction(assert(ResolvedFunction("accent")), assert(ResolvedFunction("surface"))) >= 4.5 then CFunction("accent") else CFunction("content")
	RuleFunction(".facet-appearance-link", { BackgroundTransparency = 1, TextColor3 = Accent })
	RuleFunction(".facet-appearance-link:Hover", { BackgroundTransparency = 1, TextColor3 = Accent })
	RuleFunction(".facet-appearance-link:Press", { BackgroundTransparency = 1, TextTransparency = 0.3 })
	RuleFunction(".facet-appearance-link >> .facet-button-caption", { TextColor3 = Accent })
	RuleFunction(".facet-appearance-link >> .facet-icon", { ImageColor3 = Accent })
	RuleFunction(".facet-appearance-link:Press >> .facet-button-caption", { TextTransparency = 0.3 })
	RuleFunction(".facet-appearance-link:Press >> .facet-text", { TextTransparency = 0.3 })
	RuleFunction(".facet-appearance-link:Press >> .facet-icon", { ImageTransparency = 0.3 })
	RuleFunction(".facet-appearance-link::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0)
	})
	RuleFunction(".facet-appearance-bare::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0),
		PaddingTop = p3.UDim.new(0, 0),
		PaddingBottom = p3.UDim.new(0, 0)
	})
	local InverseSurface = SourceFunction("inverseSurface")
	local OnInverse = SourceFunction("onInverse")
	RuleFunction(".facet-appearance-inverse", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("inverseSurface"),
		TextColor3 = CFunction("onInverse")
	})
	
	if InverseSurface and OnInverse then
		local _ = function(p5)
			-- upvalues: p3 (copy), InverseSurface (copy), OnInverse (copy)
			return p3.Color3.new(InverseSurface.r + (OnInverse.r - InverseSurface.r) * p5, InverseSurface.g + (OnInverse.g - InverseSurface.g) * p5, InverseSurface.b + (OnInverse.b - InverseSurface.b) * p5)
		end
		
		RuleFunction(".facet-appearance-inverse:Hover", {
			BackgroundColor3 = p3.Color3.new(InverseSurface.r + (OnInverse.r - InverseSurface.r) * 0.12, InverseSurface.g + (OnInverse.g - InverseSurface.g) * 0.12, InverseSurface.b + (OnInverse.b - InverseSurface.b) * 0.12),
			TextColor3 = CFunction("onInverse")
		})
		RuleFunction(".facet-appearance-inverse:Press", {
			BackgroundColor3 = p3.Color3.new(InverseSurface.r + (OnInverse.r - InverseSurface.r) * 0.2, InverseSurface.g + (OnInverse.g - InverseSurface.g) * 0.2, InverseSurface.b + (OnInverse.b - InverseSurface.b) * 0.2),
			TextColor3 = CFunction("onInverse")
		})
	end
	RuleFunction(".facet-appearance-inverse >> .facet-button-caption", { TextColor3 = CFunction("onInverse") })
	RuleFunction(".facet-appearance-inverse >> .facet-text", { TextColor3 = CFunction("onInverse") })
	RuleFunction(".facet-appearance-inverse >> .facet-icon", { ImageColor3 = CFunction("onInverse") })
	local Utility: number = p1.metrics.strokes.utility
	
	if type(Utility) == "number" and Utility > 0 then
		RuleFunction(".facet-appearance-utility::UIStroke", {
			Color = CFunction("hairline"),
			Transparency = Extra.hairlineOpacity,
			Thickness = Utility,
			ApplyStrokeMode = p3.Enum.ApplyStrokeMode.Border
		})
	end
	RuleFunction(".facet-button.facet-radial-label::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0),
		PaddingTop = p3.UDim.new(0, 0),
		PaddingBottom = p3.UDim.new(0, 0)
	})
	RuleFunction(".facet-grabber", {
		BackgroundTransparency = 0.5,
		BackgroundColor3 = CFunction("contentSecondary")
	})
	RuleFunction(".facet-menu-item", { BackgroundTransparency = 1 })
	RuleFunction(".facet-menu-item:Hover", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlHover")
	})
	RuleFunction(".facet-menu-item:Press", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlPressed")
	})
	RuleFunction(".facet-menu-destructive", {
		BackgroundTransparency = 1,
		TextColor3 = CFunction("danger")
	})
	RuleFunction(".facet-menu-destructive:Hover", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlHover")
	})
	RuleFunction(".facet-menu-destructive:Press", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlPressed")
	})
	RuleFunction(".facet-menu-destructive >> .facet-button-caption", { TextColor3 = CFunction("danger") })
	RuleFunction(".facet-menu-destructive >> .facet-icon", { ImageColor3 = CFunction("danger") })
	RuleFunction(".facet-menu::UIStroke", {
		Transparency = 0.3,
		Thickness = 1,
		Color = CFunction("hairline"),
		ApplyStrokeMode = p3.Enum.ApplyStrokeMode.Border
	})
	RuleFunction(".facet-menu::UIShadow", {
		Transparency = 0.35,
		BlurRadius = p3.UDim.new(0, 14),
		Offset = p3.UDim2.fromOffset(0, 3)
	})
	RuleFunction(".facet-menu-group::UICorner", { CornerRadius = p3.UDim.new(0, p1.metrics.radii.panel) })
	RuleFunction(".facet-menu-hairline", {
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("hairline"),
		BackgroundTransparency = Extra.hairlineOpacity
	})
	
	for _, value14 in { "", ":Hover", ":Press" } do
		RuleFunction(".facet-menu-item.facet-selected" .. value14, {
			BackgroundTransparency = 0,
			BackgroundColor3 = CFunction("accent"),
			TextColor3 = CFunction("onAccent")
		})
	end
	RuleFunction(".facet-menu-item.facet-selected >> .facet-button-caption", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-menu-item.facet-selected >> .facet-text", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-menu-item.facet-selected >> .facet-icon", { ImageColor3 = CFunction("onAccent") })
	RuleFunction(".facet-radial-sector", { Color3 = CFunction("surfaceStrong") })
	RuleFunction(".facet-radial-sector.facet-radial-candidate", { Color3 = CFunction("selection") })
	RuleFunction(".facet-radial-item.facet-radial-candidate >> .facet-button-caption", { TextColor3 = CFunction("onSelection") })
	RuleFunction(".facet-radial-item.facet-radial-candidate >> .facet-text", { TextColor3 = CFunction("onSelection") })
	RuleFunction(".facet-radial-item.facet-radial-candidate >> .facet-icon", { ImageColor3 = CFunction("onSelection") })
	RuleFunction(".facet-radial-item::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0),
		PaddingTop = p3.UDim.new(0, 0),
		PaddingBottom = p3.UDim.new(0, 0)
	})
	RuleFunction(".facet-button.facet-radial-row", { BackgroundTransparency = 0 })
	RuleFunction(".facet-page-indicator", { BackgroundTransparency = 1 })
	RuleFunction(".facet-page-indicator:Hover", { BackgroundTransparency = 1 })
	RuleFunction(".facet-page-indicator:Press", { BackgroundTransparency = 1 })
	RuleFunction(".facet-page-indicator.facet-selected", { BackgroundTransparency = 1 })
	RuleFunction(".facet-page-dot", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("contentSecondary")
	})
	RuleFunction(".facet-page-indicator:Hover >> .facet-page-dot", { BackgroundColor3 = CFunction("content") })
	RuleFunction(".facet-page-indicator.facet-selected >> .facet-page-dot", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("accent")
	})
	RuleFunction(".facet-floating::UIStroke", {
		Transparency = 0.3,
		Thickness = 1,
		Color = CFunction("hairline")
	})
	RuleFunction(".facet-tail", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("surfaceStrong")
	})
	local Hairline = SourceFunction("hairline")
	local Hairline1 = nil
	
	if type(Hairline) == "table" and Hairline.r ~= nil then
		Hairline1 = p3.Color3.new(Hairline.r, Hairline.g, Hairline.b)
	else
		assert(Hairline == nil or typeof(Hairline) == "Color3")
		Hairline1 = Hairline
	end
	local SurfaceStrong = SourceFunction("surfaceStrong")
	local Goal1 = nil
	
	if type(SurfaceStrong) == "table" and SurfaceStrong.r ~= nil then
		Goal1 = p3.Color3.new(SurfaceStrong.r, SurfaceStrong.g, SurfaceStrong.b)
	else
		assert(SurfaceStrong == nil or typeof(SurfaceStrong) == "Color3")
		Goal1 = SurfaceStrong
	end
	RuleFunction(".facet-outlined::UIStroke", { Transparency = 1 })
	RuleFunction(".facet-outline", { Thickness = 1, Color3 = Hairline1:Lerp(Goal1, 0.3) })
	RuleFunction(".facet-outline-tooltip", { Color3 = Hairline1:Lerp(Goal1, 0.4) })
	RuleFunction(".facet-step-circle::UIStroke", { Thickness = 1, Color = CFunction("contentSecondary") })
	RuleFunction(".facet-invalid::UIStroke", { Thickness = 1, Color = CFunction("danger") })
	RuleFunction(".facet-date-time-picker", { BackgroundTransparency = 1 })
	RuleFunction(".facet-radio-mark::UIStroke", { Thickness = 1.5, Color = CFunction("contentSecondary") })
	RuleFunction(".facet-segmented-stroke", { BackgroundTransparency = 1 })
	RuleFunction(".facet-segmented-stroke::UIStroke", { Thickness = 1, Color = CFunction("hairline") })
	RuleFunction(".facet-segmented-utility", { BackgroundTransparency = 1 })
	RuleFunction(".facet-card-option::UIStroke", { Thickness = 1, Color = CFunction("hairline") })
	RuleFunction(".facet-color-picker", { BackgroundTransparency = 1 })
	RuleFunction(".facet-color-swatch::UIStroke", {
		Transparency = 0,
		Thickness = 1,
		Color = CFunction("hairline")
	})
	RuleFunction(".facet-color-swatch >> UICorner", { CornerRadius = p3.UDim.new(0, p1.metrics.radii.control) })
	RuleFunction(".facet-color-cell::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0),
		PaddingTop = p3.UDim.new(0, 0),
		PaddingBottom = p3.UDim.new(0, 0)
	})
	
	for _, value15 in { ".facet-avatar", ".facet-button" } do
		RuleFunction(".facet-avatar-stack > " .. value15 .. "::UIStroke", {
			Thickness = 2,
			Color = CFunction("surface"),
			ApplyStrokeMode = p3.Enum.ApplyStrokeMode.Border,
			BorderStrokePosition = p3.Enum.BorderStrokePosition.Outer
		})
	end
	for i5, value16 in config1 do
		local Text = ".facet-avatar-background-" .. i5
		RuleFunction(Text, {
			BackgroundTransparency = 0,
			BackgroundColor3 = CFunction(i5),
			TextColor3 = CFunction(value16)
		})
		RuleFunction(Text .. " > .facet-text", { TextColor3 = CFunction(value16) })
		RuleFunction(Text .. " > .facet-icon", { ImageColor3 = CFunction(value16) })
	end
	local Focus = if p1.chrome then p1.chrome.focus else nil
	local Color = if Focus then Focus.color else nil
	local v8 = ".facet-focus-ring"
	local t = {}
	local NewResult1 = nil
	
	if type(Color) == "table" then
		if type(Color) == "table" and Color.r ~= nil then
			NewResult1 = p3.Color3.new(Color.r, Color.g, Color.b)
		else
			assert(Color == nil or typeof(Color) == "Color3")
			NewResult1 = Color
		end
	else
		NewResult1 = type(Color) == "string" and CFunction(string.lower((string.sub(Color, 2, 2))) .. string.sub(Color, 3)) or CFunction("accent")
	end
	t.BackgroundColor3 = NewResult1
	RuleFunction(v8, t)
	RuleFunction(".facet-focus-ring::UICorner", { CornerRadius = p3.UDim.new(0, p1.metrics.radii.control) })
	RuleFunction(".facet-drop-line", { BackgroundColor3 = CFunction("accent") })
	RuleFunction(".facet-drop-accepted", { Color = CFunction("accent") })
	RuleFunction(".facet-drop-rejected", { Color = CFunction("danger") })
	RuleFunction(".facet-avatar-ring", { Transparency = 0, Color = CFunction("accent") })
	RuleFunction(".facet-avatar-hover", { Color = CFunction("accent") })
	RuleFunction(".facet-avatar-ring-gap", { Transparency = 0, Color = CFunction("surface") })
	RuleFunction(".facet-quiet-destructive", { TextColor3 = CFunction("danger") })
	RuleFunction(".facet-quiet-destructive:Hover", { TextColor3 = CFunction("danger") })
	RuleFunction(".facet-quiet-destructive:Press", { TextColor3 = CFunction("danger") })
	RuleFunction(".facet-quiet-destructive >> .facet-button-caption", { TextColor3 = CFunction("danger") })
	RuleFunction(".facet-quiet-destructive >> .facet-icon", { ImageColor3 = CFunction("danger") })
	local Control1 = ResolvedFunction("control")
	local ContentSecondary = ResolvedFunction("contentSecondary")
	local Content = ResolvedFunction("content")
	local ContentSecondary1 = if ContrastFunction(ContentSecondary, Control1) >= 4.5 or ContrastFunction(Content, Control1) <= ContrastFunction(ContentSecondary, Control1) then ContentSecondary else Content
	RuleFunction(".facet-tab-item.facet-button-tight::UIPadding", {
		PaddingLeft = p3.UDim.new(0, Xs + (ContentInsets.left or 0)),
		PaddingRight = p3.UDim.new(0, Xs + (ContentInsets.right or 0))
	})
	RuleFunction(".facet-tab-item", {
		BackgroundTransparency = 1,
		TextColor3 = CFunction("contentSecondary")
	})
	RuleFunction(".facet-tab-item >> .facet-button-caption", { TextColor3 = CFunction("contentSecondary") })
	RuleFunction(".facet-tab-item.facet-skinned", { TextColor3 = ContentSecondary1 })
	RuleFunction(".facet-tab-item.facet-skinned >> .facet-button-caption", { TextColor3 = ContentSecondary1 })
	RuleFunction(".facet-tab-item:Hover", {
		BackgroundTransparency = 1,
		TextColor3 = CFunction("content")
	})
	RuleFunction(".facet-tab-item:Hover >> .facet-button-caption", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-tab-item:Press", {
		BackgroundTransparency = 1,
		TextColor3 = CFunction("content")
	})
	RuleFunction(".facet-tab-item:Press >> .facet-button-caption", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-tab-current", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-tab-current >> .facet-button-caption", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-tab-item.facet-selected", { BackgroundTransparency = 0, TextColor3 = OnSelected })
	RuleFunction(".facet-tab-item.facet-selected >> .facet-button-caption", { TextColor3 = OnSelected })
	RuleFunction(".facet-tab-filled", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("accent"),
		TextColor3 = CFunction("onAccent")
	})
	RuleFunction(".facet-tab-filled >> .facet-button-caption", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-tab-filled >> .facet-icon", { ImageColor3 = CFunction("onAccent") })
	RuleFunction(".facet-tab-filled >> .facet-tab-glyph >> .facet-path", { Color3 = CFunction("onAccent") })
	RuleFunction(".facet-stepper-track", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("control")
	})
	RuleFunction(".facet-stepper-track::UICorner", { CornerRadius = p3.UDim.new(0, p1.metrics.radii.control) })
	RuleFunction(".facet-skinned > #Content > .facet-stepper-track", { BackgroundTransparency = 1 })
	local StepperPlate = if p1.chrome then p1.chrome.stepperPlate else nil
	RuleFunction(".facet-skinned >> .facet-stepper-inset", {
		PaddingLeft = p3.UDim.new(0, (math.max(12, (if StepperPlate then StepperPlate.contentInsets or {} else {}).left or 0)))
	})
	RuleFunction(".facet-stepper-button", { BackgroundTransparency = 1 })
	RuleFunction(".facet-stepper-button:Hover", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlHover")
	})
	RuleFunction(".facet-stepper-button:Press", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlPressed")
	})
	RuleFunction(".facet-choice", {
		BackgroundTransparency = 1,
		TextXAlignment = p3.Enum.TextXAlignment.Left
	})
	RuleFunction(".facet-choice:Hover", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlHover")
	})
	RuleFunction(".facet-choice:Press", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlPressed")
	})
	RuleFunction(".facet-choice-current", {
		BackgroundTransparency = 0.82,
		BackgroundColor3 = CFunction("accent"),
		TextColor3 = CFunction("accent")
	})
	RuleFunction(".facet-choice-current:Hover", {
		BackgroundTransparency = 0.72,
		BackgroundColor3 = CFunction("accent")
	})
	RuleFunction(".facet-choice-current:Press", {
		BackgroundTransparency = 0.62,
		BackgroundColor3 = CFunction("accent")
	})
	RuleFunction(".facet-choice-current >> .facet-button-caption", { TextColor3 = CFunction("accent") })
	RuleFunction(".facet-choice-current >> .facet-icon", { ImageColor3 = CFunction("accent") })
	RuleFunction(".facet-segmented", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("control")
	})
	local NewControl: number = if p1.metrics.radii.control > 0 then p1.metrics.radii.control + 2 else 0
	RuleFunction(".facet-segmented::UICorner", { CornerRadius = p3.UDim.new(0, NewControl) })
	RuleFunction(".facet-tab-plate", { BackgroundColor3 = CFunction("surfaceStrong") })
	local Tab = p1.metrics.radii.tab or p1.metrics.radii.control
	RuleFunction(".facet-top-tabs > .facet-tab-plate::UICorner", {
		CornerRadius = p3.UDim.new(0, if Tab > 0 then Tab + 2 else 0)
	})
	RuleFunction(".facet-top-tabs > #Tabs >> .facet-tab-item::UICorner", { CornerRadius = p3.UDim.new(0, Tab) })
	RuleFunction(".facet-tab-plate::UIStroke", {
		Color = CFunction("hairline"),
		Transparency = Extra.hairlineOpacity,
		Thickness = p1.metrics.strokes.hairline or 1
	})
	RuleFunction(".facet-segmented::UIPadding", {
		PaddingLeft = p3.UDim.new(0, Inset),
		PaddingRight = p3.UDim.new(0, Inset),
		PaddingTop = p3.UDim.new(0, Inset),
		PaddingBottom = p3.UDim.new(0, Inset)
	})
	RuleFunction(".facet-segment", {
		BackgroundTransparency = 1,
		TextColor3 = ContentSecondary1
	})
	RuleFunction(".facet-segment::UICorner", {
		CornerRadius = p3.UDim.new(0, (math.max(0, NewControl - Inset)))
	})
	RuleFunction(".facet-segmented-pill >> .facet-segment::UICorner", { CornerRadius = p3.UDim.new(1, 0) })
	RuleFunction(".facet-stack-pill >> .facet-button::UICorner", { CornerRadius = p3.UDim.new(1, 0) })
	RuleFunction(".facet-segmented-square >> .facet-segment::UICorner", { CornerRadius = p3.UDim.new(0, 0) })
	RuleFunction(".facet-segment-fill", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = CFunction("accent")
	})
	RuleFunction(".facet-segment-fill::UICorner", {
		CornerRadius = p3.UDim.new(0, (math.max(0, NewControl - Inset)))
	})
	RuleFunction(".facet-segmented-pill >> .facet-segment-fill::UICorner", { CornerRadius = p3.UDim.new(1, 0) })
	RuleFunction(".facet-segmented-square >> .facet-segment-fill::UICorner", { CornerRadius = p3.UDim.new(0, 0) })
	RuleFunction(".facet-segment >> .facet-button-caption", { TextColor3 = ContentSecondary1 })
	RuleFunction(".facet-segment:Hover", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlHover"),
		TextColor3 = CFunction("content")
	})
	RuleFunction(".facet-segment:Press", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlPressed"),
		TextColor3 = CFunction("content")
	})
	RuleFunction(".facet-segment-current", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("accent"),
		TextColor3 = CFunction("onAccent")
	})
	RuleFunction(".facet-segment-current:Hover", {
		BackgroundColor3 = CFunction("accent"),
		TextColor3 = CFunction("onAccent")
	})
	RuleFunction(".facet-segment-current:Press", {
		BackgroundColor3 = CFunction("accent"),
		TextColor3 = CFunction("onAccent")
	})
	RuleFunction(".facet-segment-current >> .facet-button-caption", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-segment-current >> .facet-icon", { ImageColor3 = CFunction("onAccent") })
	RuleFunction(".facet-menu-destructive >> .facet-text", { TextColor3 = CFunction("danger") })
	RuleFunction(".facet-appearance-soft >> .facet-text", { TextColor3 = TextColor3 })
	RuleFunction(".facet-appearance-soft.facet-selected >> .facet-text", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-appearance-link >> .facet-text", { TextColor3 = Accent })
	RuleFunction(".facet-quiet-destructive >> .facet-text", { TextColor3 = CFunction("danger") })
	RuleFunction(".facet-menu-item::UICorner", {
		CornerRadius = p3.UDim.new(0, (math.max(0, p1.metrics.radii.panel - (p1.metrics.space or config2.metrics.space).xs)))
	})
	RuleFunction(".facet-menu-destructive", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-menu-destructive >> .facet-button-caption", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-menu-destructive >> .facet-text", { TextColor3 = CFunction("content") })
	
	for _, value18 in { ":Hover", ":Press" } do
		RuleFunction(".facet-menu-destructive" .. value18, {
			BackgroundTransparency = 0,
			BackgroundColor3 = CFunction("danger")
		})
		RuleFunction(".facet-menu-destructive" .. value18 .. " >> .facet-button-caption", { TextColor3 = CFunction("onDanger") })
		RuleFunction(".facet-menu-destructive" .. value18 .. " >> .facet-text", { TextColor3 = CFunction("onDanger") })
		RuleFunction(".facet-menu-destructive" .. value18 .. " >> .facet-icon", { ImageColor3 = CFunction("onDanger") })
	end
	for _, value19 in { "", ":Hover", ":Press" } do
		local Text = ".facet-menu-destructive.facet-disabled" .. value19
		RuleFunction(Text, { BackgroundTransparency = 1 })
		RuleFunction(Text .. " >> .facet-button-caption", { TextColor3 = CFunction("content") })
		RuleFunction(Text .. " >> .facet-text", { TextColor3 = CFunction("content") })
		RuleFunction(Text .. " >> .facet-icon", { ImageColor3 = CFunction("content") })
	end
	RuleFunction(".facet-choice-current >> .facet-text", { TextColor3 = CFunction("accent") })
	RuleFunction(".facet-tab-filled >> .facet-text", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-segment-current >> .facet-text", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-accent >> .facet-text", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-accent >> .facet-icon", { ImageColor3 = CFunction("onAccent") })
	RuleFunction(".facet-role-destructive >> .facet-shortcut-hint-bare >> .facet-shortcut-glyph", { ImageColor3 = CFunction("onDanger") })
	RuleFunction(".facet-appearance-inverse >> .facet-shortcut-hint-bare >> .facet-shortcut-glyph", { ImageColor3 = CFunction("onInverse") })
	RuleFunction(".facet-accent >> .facet-shortcut-hint-bare >> .facet-shortcut-glyph", { ImageColor3 = CFunction("onAccent") })
	local Button = Controls.button or {}
	local CaptionStroke = Button.captionStroke or 1.5
	
	if CaptionStroke > 0 then
		local config7 = {
			ApplyStrokeMode = p3.Enum.ApplyStrokeMode.Contextual,
			Color = CFunction("surface"),
			Thickness = CaptionStroke,
			Transparency = 1 - (Button.captionStrokeOpacity or 0.7)
		}
		RuleFunction("TextLabel.facet-button-outside::UIStroke", config7)
		RuleFunction(".facet-button-outside >> .facet-text::UIStroke", config7)
	end
	RuleFunction(".facet-calendar-day", { BackgroundTransparency = 1 })
	RuleFunction(".facet-calendar-day::UIPadding", {
		PaddingLeft = p3.UDim.new(0, 0),
		PaddingRight = p3.UDim.new(0, 0),
		PaddingTop = p3.UDim.new(0, 0),
		PaddingBottom = p3.UDim.new(0, 0)
	})
	local Panel = Chrome.panel
	local ContentInsets1 = if Panel then Panel.contentInsets or {} else {}
	RuleFunction(".facet-panel.facet-calendar-scroll::UIPadding", {
		PaddingLeft = p3.UDim.new(0, ContentInsets1.left or 0),
		PaddingRight = p3.UDim.new(0, ContentInsets1.right or 0),
		PaddingTop = p3.UDim.new(0, ContentInsets1.top or 0),
		PaddingBottom = p3.UDim.new(0, ContentInsets1.bottom or 0)
	})
	RuleFunction(".facet-calendar-day:Hover", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlHover")
	})
	RuleFunction(".facet-calendar-day:Press", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlPressed")
	})
	RuleFunction(".facet-calendar-band", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("controlSelected")
	})
	RuleFunction(".facet-calendar-disc", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("accent")
	})
	RuleFunction(".facet-calendar-end", { BackgroundColor3 = CFunction("content") })
	RuleFunction(".facet-calendar-today::UIStroke", { Thickness = 1, Color = CFunction("accent") })
	RuleFunction(".facet-calendar-strike", {
		BackgroundTransparency = 0,
		BackgroundColor3 = CFunction("contentSecondary")
	})
	RuleFunction(".facet-calendar-number", { FontFace = FFunction({ weight = "SemiBold" }) })
	RuleFunction(".facet-calendar-banded", { TextColor3 = OnSelected })
	RuleFunction(".facet-calendar-dim", {
		TextColor3 = CFunction("contentSecondary"),
		FontFace = FFunction({ weight = "Regular" })
	})
	RuleFunction(".facet-calendar-chosen", { TextColor3 = CFunction("onAccent") })
	RuleFunction(".facet-calendar-chosen-end", { TextColor3 = CFunction("surface") })
	RuleFunction(".facet-skinned", { BackgroundTransparency = 1 })
	
	for _, value22 in { "control", "field", "panel", "panelTail" } do
		RuleFunction(".facet-skin-art-" .. value22, if Extra.artTint then { ImageColor3 = CFunction("artTint") } else {})
	end
	for i6, value17 in config5 do
		RuleFunction(".facet-badge.facet-status-" .. i6 .. " > #SkinBoundary >> .facet-skin-art", { ImageColor3 = CFunction(value17) })
	end
	for _, value23 in { "status", "utility" } do
		RuleFunction(".facet-badge-" .. value23 .. " > #SkinBoundary >> .facet-skin-art", { ImageColor3 = p3.Color3.new(1, 1, 1) })
	end
	local ControlSelectedArtworkResult, _, ControlSelectedArtworkResult3 = ThemeSupportModule.controlSelectedArtwork(p1, config2, p3, config3)
	local HasControlSelectedArtworkResult = ControlSelectedArtworkResult ~= nil
	local NewResult11 = p3.Color3.new(1, 1, 1)
	local NewResult2 = p3.Color3.new(0, 0, 0)
	
	for _, value24 in {
		{ ".facet-role-destructive", "danger", "onDanger" },
		{ ".facet-accent", "accent", "onAccent" }
	} do
		local v9 = value24[1]
		local v10 = assert(ResolvedFunction(value24[2]))
		local v11 = assert(ResolvedFunction(value24[3]))
		local IsAccent: boolean = ControlSelectedArtworkResult3 and value24[2] == "accent"
		local IsContrastResultBelow: boolean = not IsAccent and ContrastFunction(v10, NewResult2) < ContrastFunction(v11, NewResult2)
		local Callback1: (any, any) -> () = RuleFunction
		local Text = v9 .. " > #SkinBoundary >> .facet-skin-art"
		local Label = {
			ImageColor3 = if IsContrastResultBelow then CFunction(value24[2]) else NewResult11
		}
		Callback1(Text, Label)
		Callback1 = RuleFunction
		Text = v9 .. ".facet-skinned"
		Label = {}
		Label.BackgroundTransparency = if IsContrastResultBelow or IsAccent then 1 else 0
		Label.TextColor3 = if IsAccent then OnSelected else nil
		Callback1(Text, Label)
		RuleFunction(v9 .. " > #SkinBoundary", { Visible = IsContrastResultBelow or IsAccent })
		Callback1 = RuleFunction
		Text = v9 .. ".facet-skinned >> .facet-button-caption"
		Label = if IsAccent then { TextColor3 = OnSelected } else {}
		Callback1(Text, Label)
		Callback1 = RuleFunction
		Text = v9 .. ".facet-skinned >> .facet-text"
		Label = if IsAccent then { TextColor3 = OnSelected } else {}
		Callback1(Text, Label)
		Callback1 = RuleFunction
		Text = v9 .. ".facet-skinned >> .facet-icon"
		Label = if IsAccent then { ImageColor3 = OnSelected } else {}
		Callback1(Text, Label)
	end
	RuleFunction(".facet-toggle-checkbox.facet-skinned::UIStroke", { Transparency = 1 })
	RuleFunction(".facet-menu.facet-skinned::UIStroke", { Transparency = 1 })
	RuleFunction(".facet-segment-current.facet-skinned", if HasControlSelectedArtworkResult then {} else { BackgroundTransparency = 0 })
	RuleFunction(".facet-segment-current > #SkinBoundary", if HasControlSelectedArtworkResult then {} else { Visible = false })
	RuleFunction(".facet-segment-fill", if HasControlSelectedArtworkResult then { Visible = false } else {})
	RuleFunction(".facet-segmented-slides > .facet-segment-current", if HasControlSelectedArtworkResult then {} else { BackgroundTransparency = 1 })
	local Flag = false
	
	for _, theme in p1.style.themes do
		if type(theme.extra) == "table" and theme.extra.selection ~= nil then
			Flag = true
		end
	end
	local Selection = if Flag then CFunction("selection") else CFunction("controlSelected")
	local OnSelection = if Flag then CFunction("onSelection") else OnSelected
	local List = if Flag then { "", ":Hover", ":Press" } else { "" }
	for _, value25 in List do
		RuleFunction(".facet-selection-mark.facet-selected" .. value25, { BackgroundColor3 = Selection, TextColor3 = OnSelection })
	end
	RuleFunction(".facet-selection-mark.facet-selected >> .facet-button-caption", { TextColor3 = OnSelection })
	RuleFunction(".facet-selection-mark.facet-selected >> .facet-text", { TextColor3 = OnSelection })
	RuleFunction(".facet-selection-mark.facet-selected >> .facet-icon", { ImageColor3 = OnSelection })
	
	if Flag then
		local Selection1 = CFunction("selection")
		RuleFunction(".facet-appearance-link.facet-selected", { TextColor3 = Selection1 })
		RuleFunction(".facet-appearance-link.facet-selected >> .facet-button-caption", { TextColor3 = Selection1 })
		RuleFunction(".facet-appearance-link.facet-selected >> .facet-text", { TextColor3 = Selection1 })
		RuleFunction(".facet-appearance-link.facet-selected >> .facet-icon", { ImageColor3 = Selection1 })
	end
	if Extra.dimDisabledPlates ~= true and Extra.dimDisabledPlates ~= false then
		RuleFunction(".facet-button.facet-disabled", { BackgroundTransparency = 0.6 })
	end
	if Extra.dimDisabledPlates == true then
		local DisabledContentOpacity1 = Extra.disabledContentOpacity or 0.4
		local Surface = SourceFunction("surface")
		
		local function faded(Text)
			-- upvalues: SourceFunction (copy), Surface (copy), CFunction (copy), ThemeRuleKitModuleResult (copy), p3 (copy), DisabledContentOpacity1 (copy)
			local SourceResult = SourceFunction(Text)
			
			return if SourceResult == nil or Surface == nil then CFunction(Text) else ThemeRuleKitModuleResult.derived(Text .. "Disabled", p3.Color3.new(SourceResult.r + (Surface.r - SourceResult.r) * DisabledContentOpacity1, SourceResult.g + (Surface.g - SourceResult.g) * DisabledContentOpacity1, SourceResult.b + (Surface.b - SourceResult.b) * DisabledContentOpacity1))
		end
		
		for _, value20 in {
			{ ".facet-button.facet-disabled", "control" },
			{
				".facet-button.facet-selected.facet-disabled",
				"controlSelected"
			},
			{ ".facet-accent.facet-disabled", "accent" },
			{ ".facet-appearance-soft.facet-disabled", "accent" },
			{
				".facet-appearance-inverse.facet-disabled",
				"inverseSurface"
			},
			{ ".facet-role-destructive.facet-disabled", "danger" },
			{ ".facet-disabled >> .facet-toggle-indicator", "control" },
			{ ".facet-disabled >> .facet-toggle-on", "selection" }
		} do
			RuleFunction(value20[1], { BackgroundColor3 = faded(value20[2]) })
		end
		RuleFunction(".facet-appearance-utility.facet-disabled", { BackgroundColor3 = CFunction("surface") })
		
		if Flag then
			RuleFunction(".facet-selection-mark.facet-selected.facet-disabled", { BackgroundColor3 = faded("selection") })
		end
	end
	local Tint = if ControlSelectedArtworkResult then ControlSelectedArtworkResult.tint else nil
	RuleFunction(".facet-skinned.facet-selected", if HasControlSelectedArtworkResult then { BackgroundTransparency = 1, TextColor3 = OnSelected } else {})
	RuleFunction(".facet-skinned.facet-selected > #SkinBoundary", if HasControlSelectedArtworkResult then { Visible = true } else {})
	local v12 = ".facet-skinned.facet-selected > #SkinBoundary >> .facet-skin-art"
	local Image = nil
	
	if HasControlSelectedArtworkResult then
		Image = {}
		local NewResult3 = nil
		
		if type(Tint) == "table" and Tint.r ~= nil then
			NewResult3 = p3.Color3.new(Tint.r, Tint.g, Tint.b)
		else
			assert(Tint == nil or typeof(Tint) == "Color3")
			NewResult3 = Tint
		end
		if not NewResult3 then
			NewResult3 = p3.Color3.new(1, 1, 1)
		end
		Image.ImageColor3 = NewResult3
	else
		Image = {}
	end
	RuleFunction(v12, Image)
	RuleFunction(".facet-skinned.facet-selected >> .facet-button-caption", if HasControlSelectedArtworkResult then { TextColor3 = OnSelected } else {})
	RuleFunction(".facet-skinned.facet-selected >> .facet-text", if HasControlSelectedArtworkResult then { TextColor3 = OnSelected } else {})
	RuleFunction(".facet-skinned.facet-selected >> .facet-icon", if HasControlSelectedArtworkResult then { ImageColor3 = OnSelected } else {})
	RuleFunction(".facet-selected >> .facet-text.facet-field", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-selected >> .facet-text-input >> .facet-text", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-tab-filled.facet-skinned", if HasControlSelectedArtworkResult then {} else { BackgroundTransparency = 0 })
	RuleFunction(".facet-tab-filled > #SkinBoundary", if HasControlSelectedArtworkResult then {} else { Visible = false })
	RuleFunction(".facet-button-outside, .facet-button-outside >> .facet-text", { TextColor3 = CFunction("content") })
	RuleFunction(".facet-button-outside >> .facet-shortcut-glyph", { ImageColor3 = CFunction("contentStrong") })
	
	for _, value21 in {
		{ "facet-accent", "onAccent", "accent" },
		{ "facet-role-destructive", "onDanger", "danger" },
		{
			"facet-appearance-inverse",
			"onInverse",
			"inverseSurface"
		}
	} do
		local SourceResult = SourceFunction(value21[2])
		local v13 = nil
		
		if type(SourceResult) == "table" and SourceResult.r ~= nil then
			v13 = p3.Color3.new(SourceResult.r, SourceResult.g, SourceResult.b)
		else
			assert(SourceResult == nil or typeof(SourceResult) == "Color3")
			v13 = SourceResult
		end
		SourceResult = SourceFunction(value21[3])
		local Interpolated = nil
		
		if type(SourceResult) == "table" and SourceResult.r ~= nil then
			Interpolated = p3.Color3.new(SourceResult.r, SourceResult.g, SourceResult.b)
		else
			assert(SourceResult == nil or typeof(SourceResult) == "Color3")
			Interpolated = SourceResult
		end
		if v13 and Interpolated then
			if Extra.dimDisabledPlates then
				local Surface = SourceFunction("surface")
				local Goal = nil
				
				if type(Surface) == "table" and Surface.r ~= nil then
					Goal = p3.Color3.new(Surface.r, Surface.g, Surface.b)
				else
					assert(Surface == nil or typeof(Surface) == "Color3")
					Goal = Surface
				end
				if Goal then
					Interpolated = Interpolated:Lerp(Goal, Extra.disabledContentOpacity or 0.4)
				end
			end
			local Text = "." .. value21[1] .. ".facet-disabled"
			RuleFunction(Text .. ", " .. Text .. " >> .facet-button-caption, " .. Text .. " >> .facet-text", {
				TextTransparency = ThemeSupportModule.readableTransparency(v13, Interpolated, Extra.disabledContentOpacity or 0.4)
			})
		end
	end
	RuleFunction(".facet-button-captioned.facet-disabled", { TextTransparency = 1 })
	
	return ThemeRuleKitModuleResult.finish()
end

local t = {}
setmetatable(t, { __mode = "k" })

return function(Key)
	-- upvalues: t (copy), config (copy), ThemeStylesheetModule (copy), config2 (copy), rulesFor (copy), ThemeSkinModule (copy), config3 (copy)
	local Entry = t[Key]
	
	if Entry then
		return Entry
	else
		local config1 = {
			SCHEMA = config.SCHEMA,
			TYPE_ROLES = config.TYPE_ROLES,
			REQUIRED_TYPE_ROLES = config.REQUIRED_TYPE_ROLES,
			neutralPackage = config.neutralPackage,
			forDistance = config.forDistance,
			forResolution = config.forResolution,
			define = config.define,
			checkCoverage = config.checkCoverage,
			resolveIcon = config.resolveIcon,
			createStyleSheet = function(p5, p6, p7)
				-- upvalues: ThemeStylesheetModule (upval), config2 (upval), rulesFor (upval), config (upval), Key (copy)
				return ThemeStylesheetModule(config2, rulesFor, config.forDistance, Key, p5, p6, p7)
			end,
			skin = function(p5, p6, p7, p8)
				-- upvalues: ThemeSkinModule (upval), config2 (upval), config3 (upval), Key (copy)
				return ThemeSkinModule(config2, config3, Key, p5, p6, p7, p8)
			end
		}
		t[Key] = config1
		
		return config1
	end
end