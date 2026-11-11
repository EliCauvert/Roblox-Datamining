local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local ReactModule = require(CorePackages.Packages.React)
local UseStateFunction = ReactModule.useState

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), UseStateFunction (copy), RunService (copy)
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(false)
	local UseStateResult, UseStateResult2 = UseStateFunction(1)
	
	local function v7(): UDim2
		-- upvalues: p1 (copy), UseStateResult (copy)
		return if p1.screenSize.X / (p1.screenSize.Y - p1.videoBottomOffsetHeight) < UseStateResult then UDim2.new(0, 1e999, 1, 0) else UDim2.new(1, 0, 0, 1e999)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval)
		RunService:setThrottleFramerateEnabled(false)
		
		return function()
			-- upvalues: RunService (upval)
			RunService:setThrottleFramerateEnabled(true)
		end
	end, {})
	
	return ReactModule.createElement("Frame", { BorderSizePixel = 0, Size = UDim2.new(1, 0, 1, 0) }, {
		VideoBox = ReactModule.createElement("Frame", {
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, p1.videoBottomOffsetHeight * -1)
		}, {
			Video = ReactModule.createElement("VideoFrame", {
				Video = p1.landingVideoAsset,
				Size = v7(),
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				Looped = true,
				Playing = true,
				Volume = 0,
				BorderSizePixel = 0,
				[ReactModule.Event.Loaded] = function(p2)
					-- upvalues: UseStateResult2 (copy)
					local Resolution = p2.Resolution
					
					if Resolution.X > 0 and Resolution.Y > 0 then
						UseStateResult2(Resolution.X / Resolution.Y)
					end
				end,
				ref = UseRefResult
			}, {
				UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", {
					AspectRatio = UseStateResult,
					AspectType = Enum.AspectType.FitWithinMaxSize
				})
			})
		}),
		FadeToBlack = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, p1.videoBottomOffsetGradientHeight),
			Position = UDim2.new(0, 0, 1, p1.videoBottomOffsetHeight * -1 + 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = UseStyleResult.Theme.DropShadow.Color
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 270,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, UseStyleResult.Theme.DropShadow.Color),
					ColorSequenceKeypoint.new(1, UseStyleResult.Theme.DropShadow.Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		BlackBackground = ReactModule.createElement("Frame", {
			Visible = true,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, p1.videoBottomOffsetHeight),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color
		})
	})
end