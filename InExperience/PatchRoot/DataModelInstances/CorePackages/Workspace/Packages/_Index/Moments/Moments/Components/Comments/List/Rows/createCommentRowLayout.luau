local _ = require(script:FindFirstAncestor("Moments").Parent.Foundation)
local _ = require(script.Parent.CommentRowTypes)

local function resolveFont(p1, p2)
	return if typeof(p1) == "Font" then p1 elseif typeof(p1) == "EnumItem" then Font.fromEnum(p1) elseif type(p1) == "table" and type(p1.Family) == "string" then Font.new(p1.Family, p1.Weight, p1.Style) else Font.fromEnum(p2)
end

local function _(p1, p2, p3)
	-- upvalues: resolveFont (ref)
	return {
		font = resolveFont(p1.Font, p2),
		fontSize = p1.FontSize or p3,
		lineHeight = p1.LineHeight or 1
	}
end

local _ = function(p1)
	return math.max(1, math.ceil(p1.fontSize * p1.lineHeight))
end

return function(p1)
	-- upvalues: resolveFont (ref)
	local none = p1.Padding.None
	local var1 = p1.Size.Size_600 + p1.Size.Size_100
	local xSmall = p1.Gap.XSmall
	local titleMedium = p1.Typography.TitleMedium
	local t = {
		font = resolveFont(titleMedium.Font, Enum.Font.BuilderSansBold),
		fontSize = titleMedium.FontSize or 14,
		lineHeight = titleMedium.LineHeight or 1
	}
	local bodyMedium = p1.Typography.BodyMedium
	local t_1 = {
		font = resolveFont(bodyMedium.Font, Enum.Font.BuilderSans),
		fontSize = bodyMedium.FontSize or 14,
		lineHeight = bodyMedium.LineHeight or 1
	}
	local bodySmall = p1.Typography.BodySmall
	local t_2 = {
		font = resolveFont(bodySmall.Font, Enum.Font.BuilderSans),
		fontSize = bodySmall.FontSize or 12,
		lineHeight = bodySmall.LineHeight or 1
	}
	local size600 = p1.Size.Size_600
	
	return {
		verticalPadding = none,
		avatarSize = var1,
		avatarContentGap = p1.Gap.Medium,
		authorBodyGap = xSmall,
		reactionColumnGap = p1.Gap.XSmall,
		reactionColumnWidth = p1.Size.Size_800,
		reactionButtonSize = size600,
		reactionSummaryGap = p1.Gap.Small,
		rowGap = p1.Gap.Large,
		estimatedRowHeight = math.max(1, 2 * none + math.max(var1, math.max(1, math.ceil(t.fontSize * t.lineHeight)), math.max(1, math.ceil(t_2.fontSize * t_2.lineHeight))) + xSmall + math.max(math.max(1, math.ceil(t_1.fontSize * t_1.lineHeight)), size600) + 2),
		authorTypography = t,
		bodyTypography = t_1,
		metadataTypography = t_2
	}
end