local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RunService = game:GetService("RunService")
local WithStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Style.withStyle
local RoactModule = require(Modules.Common.Roact)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local ShimmerAnimationModule = require(Modules.LuaApp.Components.ShimmerAnimation)
local config = {
	Image = "LuaApp/buttons/buttonFill",
	SliceCenter = Rect.new(8, 8, 9, 9)
}
local config1 = {
	Image = "LuaApp/buttons/buttonStroke",
	SliceCenter = Rect.new(8, 8, 9, 9)
}
local RetryButton = RoactModule.PureComponent:extend("RetryButton")

function RetryButton.init(p1)
	p1.state = { isRetrying = false, isInCooldown = false }
	p1._isMounted = false
	p1.cooldownTimer = 0
	
	function p1.safeSetState(p2)
		-- upvalues: p1 (copy)
		if p1._isMounted then
			p1:setState(p2)
		end
	end
	
	function p1.onActivated()
		-- upvalues: p1 (copy)
		local OnRetryFunction = p1.props.onRetry
		local IsInCooldown = p1.state.isInCooldown
		
		if not p1.state.isRetrying and not IsInCooldown and OnRetryFunction then
			p1.cooldownTimer = 0
			p1.safeSetState({ isRetrying = true, isInCooldown = true })
			OnRetryFunction():andThen(function()
				-- upvalues: p1 (upval)
				p1.safeSetState({ isRetrying = false })
			end, function()
				-- upvalues: p1 (upval)
				p1.safeSetState({ isRetrying = false })
			end)
		end
	end
	
	function p1.renderSteppedCallback(p2)
		-- upvalues: p1 (copy)
		if p1.state.isInCooldown then
			p1.cooldownTimer += p2
			
			if p1.cooldownTimer >= 1.5 then
				p1.safeSetState({ isInCooldown = false })
			end
		end
	end
end

function RetryButton.didMount(p1)
	p1._isMounted = true
end

function RetryButton.willUnmount(p1)
	p1._isMounted = false
end

function RetryButton.isDisabled(p1)
	local IsInCooldown = p1.state.isInCooldown
	
	return p1.state.isRetrying or IsInCooldown
end

local function _(p1: number, p2: number): number
	return 1 - (1 - p1) * (1 - p2)
end

function RetryButton.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), DEPRECATEDImageSetButtonModule (copy), config (copy), DEPRECATEDImageSetLabelModule (copy), config1 (copy), ShimmerAnimationModule (copy), ExternalEventConnectionModule (copy), RunService (copy)
	local Position = p1.props.Position
	local AnchorPoint = p1.props.AnchorPoint
	local LayoutOrder = p1.props.LayoutOrder
	local IsDisabled = p1:isDisabled()
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), DEPRECATEDImageSetButtonModule (upval), Position (copy), AnchorPoint (copy), LayoutOrder (copy), config (upval), IsDisabled (copy), p1 (copy), DEPRECATEDImageSetLabelModule (upval), config1 (upval), ShimmerAnimationModule (upval), ExternalEventConnectionModule (upval), RunService (upval)
		return RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
			Size = UDim2.new(0, 44, 0, 44),
			Position = Position,
			AnchorPoint = AnchorPoint,
			LayoutOrder = LayoutOrder,
			BackgroundTransparency = 1,
			Image = config.Image,
			ImageColor3 = p2.Theme.UIEmphasis.Color,
			ImageTransparency = 1 - (1 - p2.Theme.UIEmphasis.Transparency) * (1 - (if IsDisabled then 0.5 else 0)),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = config.SliceCenter,
			[RoactModule.Event.Activated] = p1.onActivated
		}, {
			Border = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Image = config1.Image,
				ImageColor3 = p2.Theme.SecondaryDefault.Color,
				ImageTransparency = 1 - (1 - p2.Theme.SecondaryDefault.Transparency) * (1 - (if IsDisabled then 0.5 else 0)),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = config1.SliceCenter
			}),
			Spinner = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				Image = "LuaApp/icons/common_refresh",
				Size = UDim2.new(0, 36, 0, 36),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = 1 - (1 - p2.Theme.IconEmphasis.Transparency) * (1 - (if IsDisabled then 0.5 else 0))
			}),
			Shimmer = IsDisabled and RoactModule.createElement(ShimmerAnimationModule, {
				Size = UDim2.new(1, -2, 1, -2),
				Position = UDim2.new(0, 1, 0, 1)
			}),
			renderStepped = RoactModule.createElement(ExternalEventConnectionModule, {
				event = RunService.renderStepped,
				callback = p1.renderSteppedCallback
			})
		})
	end)
end

return RetryButton