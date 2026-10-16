local TweenService = game:GetService("TweenService")
local PageLoadConfigModule = require(script.Parent.PageLoadConfig)
local VisualDebugManager = {}
VisualDebugManager.__index = VisualDebugManager

local function getRandomHighlightColor(): Color3 --[[ Line: 8 ]]
	return Color3.new(math.random() * 0.6 + 0.4, math.random() * 0.6 + 0.4, math.random() * 0.6 + 0.4)
end

function VisualDebugManager.new() --[[ Line: 15 ]]
	-- upvalues: VisualDebugManager (copy)
	local config = { originalProperties = {} }
	setmetatable(config, VisualDebugManager)
	
	return config
end

function VisualDebugManager:highlightComponent(Frame: Frame) --[[ Line: 30 ]]
	-- upvalues: PageLoadConfigModule (copy), getRandomHighlightColor (copy), TweenService (copy)
	if self.originalProperties[Frame] then return end
	if Frame.BackgroundColor3 == PageLoadConfigModule.VISUAL_DEBUG.HIGHLIGHT_COLOR then return end
	local BackgroundTransparency: number = Frame.BackgroundTransparency
	local BorderSizePixel: number = Frame.BorderSizePixel
	self.originalProperties[Frame] = {
		backgroundColor = Frame.BackgroundColor3,
		backgroundTransparency = BackgroundTransparency,
		borderColor = Frame.BorderColor3,
		borderSize = BorderSizePixel
	}
	Frame.BackgroundColor3 = PageLoadConfigModule.VISUAL_DEBUG.HIGHLIGHT_COLOR or getRandomHighlightColor()
	
	if BackgroundTransparency >= 0.95 then
		Frame.BackgroundTransparency = 0.5
	else
		Frame.BackgroundTransparency = math.max(0.3, BackgroundTransparency - PageLoadConfigModule.VISUAL_DEBUG.TRANSPARENCY_REDUCTION)
	end
	Frame.BorderColor3 = PageLoadConfigModule.VISUAL_DEBUG.BORDER_COLOR
	Frame.BorderSizePixel = math.max(PageLoadConfigModule.VISUAL_DEBUG.MIN_BORDER_SIZE, BorderSizePixel)
	task.delay(PageLoadConfigModule.VISUAL_DEBUG.HIGHLIGHT_DURATION, function() --[[ Line: 61 ]]
		-- upvalues: Frame (copy), self (copy), PageLoadConfigModule (upval), TweenService (upval)
		if Frame.Parent and self.originalProperties[Frame] then
			local OriginalProperty = self.originalProperties[Frame]
			local Tween = TweenService:Create(Frame, TweenInfo.new(PageLoadConfigModule.VISUAL_DEBUG.FADE_DURATION, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				BackgroundColor3 = PageLoadConfigModule.VISUAL_DEBUG.END_COLOR,
				BackgroundTransparency = OriginalProperty.backgroundTransparency * 0.9,
				BorderSizePixel = OriginalProperty.borderSize
			})
			Tween.Completed:Connect(function() --[[ Line: 76 ]]
				-- upvalues: self (upval), Frame (upval)
				self.originalProperties[Frame] = nil
			end)
			Tween:Play()
		end
	end)
end

function VisualDebugManager:clearAllHighlights() --[[ Line: 85 ]]
	for i, originalProperty in self.originalProperties do
		if i.Parent then
			i.BackgroundColor3 = originalProperty.backgroundColor
			i.BackgroundTransparency = originalProperty.backgroundTransparency
			i.BorderColor3 = originalProperty.borderColor
			i.BorderSizePixel = originalProperty.borderSize
		end
	end
	self.originalProperties = {}
end

function VisualDebugManager:destroy() --[[ Line: 97 ]]
	self:clearAllHighlights()
end

return VisualDebugManager