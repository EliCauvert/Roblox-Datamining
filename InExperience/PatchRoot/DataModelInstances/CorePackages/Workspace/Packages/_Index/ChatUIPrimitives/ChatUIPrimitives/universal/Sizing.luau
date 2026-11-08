local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local FFlagExpChatMessageListScrollParityModule = require(ChatUIPrimitives.Flags.FFlagExpChatMessageListScrollParity)
local Keys = ResponsiveModule.Keys
local GetMinWidthForFunction = ResponsiveModule.BreakpointConfig.getMinWidthFor
local list = {
	{
		Key = Keys.Large,
		minWidth = GetMinWidthForFunction(Keys.Large)
	},
	{
		Key = Keys.Medium,
		minWidth = GetMinWidthForFunction(Keys.Medium)
	},
	{ Key = "Regular", minWidth = 480 },
	{ Key = "Compact", minWidth = 1 }
}
local config = {
	[Keys.Large] = { density = "regular", widthUnits = 3 },
	[Keys.Medium] = { density = "regular", widthUnits = 2 },
	Regular = { density = "regular", widthUnits = 1 },
	Compact = { density = "compact", widthUnits = 1 }
}
local Context = ReactModule.createContext(nil)

local function _(FontStyle)
	return {
		Font = FontStyle.Font,
		FontSize = FontStyle.FontSize,
		LineHeight = FontStyle.LineHeight
	}
end

local _ = function(FontStyle): number
	return (math.round(FontStyle.FontSize * FontStyle.LineHeight))
end

local function resolve(Density, p1, UseTokensResult)
	-- upvalues: FFlagExpChatMessageListScrollParityModule (copy)
	local IsCompact = Density == "compact"
	local Small = if IsCompact then UseTokensResult.Padding.Small else UseTokensResult.Padding.Medium
	local ScaledSize = UseTokensResult.Size.Size_3000 * (if IsCompact then 2 else p1)
	local Largest = math.max(0, ScaledSize - Small * 2)
	local CaptionSmall = if IsCompact then UseTokensResult.Typography.CaptionSmall else UseTokensResult.Typography.BodyMedium
	local FontStyle = {
		Font = CaptionSmall.Font,
		FontSize = CaptionSmall.FontSize,
		LineHeight = CaptionSmall.LineHeight
	}
	local Size100: number = UseTokensResult.Size.Size_100
	local BodySmall = if IsCompact then UseTokensResult.Typography.BodySmall else UseTokensResult.Typography.BodyLarge
	local CaptionSmall1 = if IsCompact then UseTokensResult.Typography.CaptionSmall else UseTokensResult.Typography.CaptionLarge
	local config = {
		Font = CaptionSmall1.Font,
		FontSize = CaptionSmall1.FontSize,
		LineHeight = CaptionSmall1.LineHeight
	}
	local BodyLarge = UseTokensResult.Typography.BodyLarge
	local config1 = {
		Font = BodyLarge.Font,
		FontSize = BodyLarge.FontSize,
		LineHeight = BodyLarge.LineHeight
	}
	
	return {
		density = Density,
		bubble = {
			paddingX = Small,
			paddingY = if IsCompact then UseTokensResult.Padding.XSmall else UseTokensResult.Padding.Small,
			minHeight = if IsCompact then 0 else UseTokensResult.Size.Size_1000,
			cornerRadius = if IsCompact then UseTokensResult.Size.Size_350 else UseTokensResult.Size.Size_500,
			maxWidth = ScaledSize,
			contentMaxWidth = Largest,
			fontStyle = {
				Font = BodySmall.Font,
				FontSize = BodySmall.FontSize,
				LineHeight = BodySmall.LineHeight
			}
		},
		avatar = {
			tag = {
				["size-500-500"] = IsCompact,
				["size-700-700"] = not IsCompact
			}
		},
		row = {
			tag = {
				["padding-x-small"] = IsCompact,
				["padding-x-medium"] = not IsCompact
			}
		},
		username = {
			tag = {
				["padding-left-small text-caption-small"] = IsCompact,
				["padding-left-medium text-caption-medium"] = not IsCompact
			}
		},
		timestamp = {
			tag = {
				["padding-top-small text-caption-small"] = IsCompact,
				["text-body-large"] = not IsCompact
			}
		},
		system = {
			tag = {
				["padding-top-medium text-caption-small"] = IsCompact,
				["padding-bottom-xsmall padding-top-large text-caption-medium"] = not IsCompact
			}
		},
		reply = {
			fontStyle = FontStyle,
			markerWidth = Size100,
			textMaxWidth = math.max(0, Largest - Size100 - UseTokensResult.Gap.Small),
			textMaxHeight = math.ceil(FontStyle.FontSize * FontStyle.LineHeight * 3),
			leftLabelTag = {
				["padding-left-small text-align-x-left text-caption-small"] = IsCompact,
				["padding-left-medium text-align-x-left text-caption-medium"] = not IsCompact
			},
			rightLabelTag = {
				["padding-right-small text-align-x-right text-caption-small"] = IsCompact,
				["padding-right-medium text-align-x-right text-caption-medium"] = not IsCompact
			}
		},
		discussion = {
			columnTag = "col grow size-0 auto-y gap-xsmall",
			topLineTag = "row align-y-center size-full-0 auto-y gap-xsmall",
			frameTag = if IsCompact then "col size-full-0 auto-y padding-x-small" else "col size-full-0 auto-y padding-x-medium",
			headRowTag = if IsCompact then "row align-x-left align-y-top size-full-0 auto-y gap-small padding-top-medium" else "row align-x-left align-y-top size-full-0 auto-y gap-medium padding-top-large",
			continuationRowTag = if IsCompact then "row align-x-left align-y-top size-full-0 auto-y gap-small padding-top-xxsmall" else "row align-x-left align-y-top size-full-0 auto-y gap-medium padding-top-xxsmall",
			gutterTag = if IsCompact then "size-600-0" else "size-800-0",
			avatarTag = if IsCompact then "size-600-600" else "size-800-800",
			nameTag = if IsCompact then "auto-xy text-align-x-left text-caption-small content-default" else "auto-xy text-align-x-left text-caption-large content-default",
			timestampTag = if IsCompact then "auto-xy padding-x-xsmall text-caption-small content-muted" else "auto-xy padding-x-xsmall text-body-small content-muted",
			estimatedRowHeight = (if IsCompact then UseTokensResult.Padding.Medium else UseTokensResult.Padding.Large) + math.round(config.FontSize * config.LineHeight) + UseTokensResult.Gap.XSmall + math.round(config1.FontSize * config1.LineHeight)
		},
		list = {
			scrollBarThickness = if IsCompact then if FFlagExpChatMessageListScrollParityModule then 8 else 4 else 12,
			scrollBarInset = if FFlagExpChatMessageListScrollParityModule then Enum.ScrollBarInset.Always else Enum.ScrollBarInset.ScrollBar,
			scrollBarColor = if FFlagExpChatMessageListScrollParityModule then UseTokensResult.Color.Shift.Shift_400.Color3 else nil
		}
	}
end

local function useResolvedSizing(Density, WidthUnits)
	-- upvalues: FoundationModule (copy), ReactModule (copy), resolve (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.useMemo(function()
		-- upvalues: resolve (upval), Density (copy), WidthUnits (copy), UseTokensResult (copy)
		return (resolve(Density, WidthUnits, UseTokensResult))
	end, { Density, WidthUnits, UseTokensResult })
end

return {
	COMPACT_BELOW_WIDTH = 480,
	Context = Context,
	Provider = function(p1)
		-- upvalues: useResolvedSizing (copy), ReactModule (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, {
			value = useResolvedSizing(p1.density, p1.widthUnits or 1)
		}, p1.children)
	end,
	resolve = resolve,
	useMeasured = function()
		-- upvalues: ResponsiveModule (copy), list (copy), ReactModule (copy), config (copy)
		local UseRefResult = ReactModule.useRef(nil)
		local Entry = config[ResponsiveModule.useResponsive(list)]
		
		if Entry ~= nil then
			UseRefResult.current = Entry
		end
		return UseRefResult.current
	end,
	useResolvedSizing = useResolvedSizing,
	useSizing = function()
		-- upvalues: ReactModule (copy), Context (copy), useResolvedSizing (copy)
		local UseContextResult = ReactModule.useContext(Context)
		local Regular = useResolvedSizing("regular", 1)
		
		return if UseContextResult == nil then Regular else UseContextResult
	end
}