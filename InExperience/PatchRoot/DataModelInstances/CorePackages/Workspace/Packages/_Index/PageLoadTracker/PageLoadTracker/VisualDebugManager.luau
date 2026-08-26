local tweenService = game:GetService("TweenService")
local pageLoadConfigModule = require(script.Parent.PageLoadConfig)
local t = {}
t.__index = t

local function getRandomHighlightColor()
	return Color3.new(math.random() * 0.6 + 0.4, math.random() * 0.6 + 0.4, math.random() * 0.6 + 0.4)
end

function t.new()
	-- upvalues: t (ref)
	local t_1 = { originalProperties = {} }
	setmetatable(t_1, t)
	
	return t_1
end

function t:highlightComponent(p1)
	-- upvalues: pageLoadConfigModule (ref), getRandomHighlightColor (ref), tweenService (ref)
	if self.originalProperties[p1] then return end
	if p1.BackgroundColor3 == pageLoadConfigModule.VISUAL_DEBUG.HIGHLIGHT_COLOR then return end
	local backgroundColor3 = p1.BackgroundColor3
	local backgroundTransparency = p1.BackgroundTransparency
	local borderSizePixel = p1.BorderSizePixel
	self.originalProperties[p1] = {
		backgroundColor = backgroundColor3,
		backgroundTransparency = backgroundTransparency,
		borderColor = p1.BorderColor3,
		borderSize = borderSizePixel
	}
	p1.BackgroundColor3 = pageLoadConfigModule.VISUAL_DEBUG.HIGHLIGHT_COLOR or getRandomHighlightColor()
	
	if backgroundTransparency >= 0.95 then
		p1.BackgroundTransparency = 0.5
	else
		p1.BackgroundTransparency = math.max(0.3, backgroundTransparency - pageLoadConfigModule.VISUAL_DEBUG.TRANSPARENCY_REDUCTION)
	end
	p1.BorderColor3 = pageLoadConfigModule.VISUAL_DEBUG.BORDER_COLOR
	p1.BorderSizePixel = math.max(pageLoadConfigModule.VISUAL_DEBUG.MIN_BORDER_SIZE, borderSizePixel)
	task.delay(pageLoadConfigModule.VISUAL_DEBUG.HIGHLIGHT_DURATION, function()
		-- upvalues: p1 (ref), self (ref), pageLoadConfigModule (copy), tweenService (copy)
		if p1.Parent and self.originalProperties[p1] then
			local var1 = self.originalProperties[p1]
			local var2 = tweenService:Create(p1, TweenInfo.new(pageLoadConfigModule.VISUAL_DEBUG.FADE_DURATION, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				BackgroundColor3 = pageLoadConfigModule.VISUAL_DEBUG.END_COLOR,
				BackgroundTransparency = var1.backgroundTransparency * 0.9,
				BorderSizePixel = var1.borderSize
			})
			var2.Completed:Connect(function()
				-- upvalues: self (copy), p1 (copy)
				self.originalProperties[p1] = nil
			end)
			var2:Play()
		end
	end)
end

function t:clearAllHighlights()
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

function t:destroy()
	self:clearAllHighlights()
end

return t