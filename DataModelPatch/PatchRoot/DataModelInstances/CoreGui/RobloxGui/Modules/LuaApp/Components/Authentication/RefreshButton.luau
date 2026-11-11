local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local RoactModule = require(Modules.Common.Roact)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local Interactable = UIBloxModule.Core.Control.Interactable
local RefreshButton = RoactModule.PureComponent:extend("RefreshButton")

function RefreshButton.init(p1)
	-- upvalues: ControlState (copy)
	p1.state = {
		isRefreshing = false,
		isInCooldown = false,
		controlState = ControlState.Initialize
	}
	p1.loadSuggestions = p1.props.loadSuggestions
	p1.finishSuggestions = p1.props.finishSuggestions
	p1._isMounted = false
	p1.cooldownTimer = 0
	
	function p1.safeSetState(p2)
		-- upvalues: p1 (copy)
		if p1._isMounted then
			p1:setState(p2)
		end
	end
	
	function p1:onStateChanged(Default)
		-- upvalues: ControlState (upval), p1 (copy)
		if Default == ControlState.Pressed then
			local OnRefreshFunction: () -> () = p1.props.onRefresh
			local IsInCooldown = p1.state.isInCooldown
			
			if not p1.state.isRefreshing and not IsInCooldown and OnRefreshFunction then
				p1.loadSuggestions()
				p1.cooldownTimer = 0
				p1.safeSetState({ isRefreshing = true, isInCooldown = true })
				OnRefreshFunction()
				p1.safeSetState({ isRefreshing = false })
			end
		end
		if Default == ControlState.Default then
			p1.safeSetState({ isRefreshing = false })
		end
	end
	
	function p1.renderSteppedCallback(p2)
		-- upvalues: p1 (copy)
		if p1.state.isInCooldown then
			p1.cooldownTimer += p2
			
			if p1.cooldownTimer >= 1.5 then
				p1.safeSetState({ isInCooldown = false })
				p1.finishSuggestions()
			end
		end
	end
end

function RefreshButton.didMount(p1)
	p1._isMounted = true
end

function RefreshButton.willUnmount(p1)
	p1._isMounted = false
end

function RefreshButton.isDisabled(p1)
	local IsInCooldown = p1.state.isInCooldown
	
	return p1.state.isRefreshing or IsInCooldown
end

local function _(p1: number, p2: number): number
	return 1 - (1 - p1) * (1 - p2)
end

function RefreshButton.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Interactable (copy), ImageSetLabel (copy), GetImageDataFunction (copy), ExternalEventConnectionModule (copy), RunService (copy)
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	local IsDisabled = p1:isDisabled()
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), Interactable (upval), Position (copy), LayoutOrder (copy), p1 (copy), ImageSetLabel (upval), GetImageDataFunction (upval), IsDisabled (copy), ExternalEventConnectionModule (upval), RunService (upval)
		return RoactModule.createElement(Interactable, {
			Size = UDim2.new(0, 30, 0, 30),
			Position = Position,
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			onStateChanged = p1.onStateChanged,
			[RoactModule.Event.Activated] = function() end
		}, {
			RefreshFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 30, 0, 30)
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Spinner = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 25, 0, 25),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Image = GetImageDataFunction("LuaApp/icons/common_refresh") or "LuaApp/icons/common_refresh",
					ImageColor3 = p2.Theme.IconEmphasis.Color,
					ImageTransparency = 1 - (1 - p2.Theme.IconEmphasis.Transparency) * (1 - (if IsDisabled then 0.5 else 0))
				}),
				renderStepped = RoactModule.createElement(ExternalEventConnectionModule, {
					event = RunService.renderStepped,
					callback = p1.renderSteppedCallback
				})
			})
		})
	end)
end

return RefreshButton