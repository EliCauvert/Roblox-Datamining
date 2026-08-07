local tweenService = game:GetService("TweenService")
local pageLoadConfigModule = require(script.Parent.PageLoadConfig)
local t = {}
t.__index = t

local function getRandomHighlightColor() --[[ line: 8 ]]
	return Color3.new(math.random() * 0.6 + 0.4, math.random() * 0.6 + 0.4, math.random() * 0.6 + 0.4)
end

function t.new() --[[ line: 15 ]]
	-- upvalues: t (ref)
	local t_1 = { originalProperties = {} }
	setmetatable(t_1, t)
	
	return t_1
end

function t:highlightComponent(p0) --[[ line: 30 ]]
	-- upvalues: pageLoadConfigModule (ref), getRandomHighlightColor (ref), tweenService (ref)
	if self.originalProperties[p0] then return end
	if p0.BackgroundColor3 == pageLoadConfigModule.VISUAL_DEBUG.HIGHLIGHT_COLOR then return end
	local backgroundColor3 = p0.BackgroundColor3
	local backgroundTransparency = p0.BackgroundTransparency
	local borderSizePixel = p0.BorderSizePixel
	self.originalProperties[p0] = {
		backgroundColor = backgroundColor3,
		backgroundTransparency = backgroundTransparency,
		borderColor = p0.BorderColor3,
		borderSize = borderSizePixel
	}
	p0.BackgroundColor3 = pageLoadConfigModule.VISUAL_DEBUG.HIGHLIGHT_COLOR or getRandomHighlightColor()
	
	if backgroundTransparency >= 0.95 then
		p0.BackgroundTransparency = 0.5
	else
		p0.BackgroundTransparency = math.max(0.3, backgroundTransparency - pageLoadConfigModule.VISUAL_DEBUG.TRANSPARENCY_REDUCTION)
	end
	p0.BorderColor3 = pageLoadConfigModule.VISUAL_DEBUG.BORDER_COLOR
	p0.BorderSizePixel = math.max(pageLoadConfigModule.VISUAL_DEBUG.MIN_BORDER_SIZE, borderSizePixel)
	task.delay(pageLoadConfigModule.VISUAL_DEBUG.HIGHLIGHT_DURATION, function() --[[ line: 61 ]]
		-- upvalues: p0 (ref), self (ref), pageLoadConfigModule (copy), tweenService (copy)
		if p0.Parent and self.originalProperties[p0] then
			local var5 = self.originalProperties[p0]
			local var6 = tweenService:Create(p0, TweenInfo.new(pageLoadConfigModule.VISUAL_DEBUG.FADE_DURATION, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				BackgroundColor3 = pageLoadConfigModule.VISUAL_DEBUG.END_COLOR,
				BackgroundTransparency = var5.backgroundTransparency * 0.9,
				BorderSizePixel = var5.borderSize
			})
			var6.Completed:Connect(function() --[[ line: 76 ]]
				-- upvalues: self (copy), p0 (copy)
				self.originalProperties[p0] = nil
			end)
			var6:Play()
		end
	end)
end

function t:clearAllHighlights() --[[ line: 85 ]]
	for i, v in self.originalProperties do
		if i.Parent then
			i.BackgroundColor3 = v.backgroundColor
			i.BackgroundTransparency = v.backgroundTransparency
			i.BorderColor3 = v.borderColor
			i.BorderSizePixel = v.borderSize
		end
	end
	self.originalProperties = {}
end

function t:destroy() --[[ line: 97 ]]
	self:clearAllHighlights()
end

return t