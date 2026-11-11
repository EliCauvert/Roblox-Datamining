local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local InviteStatus = require(script.Parent.Parent.Parent.Resources.Constants).InviteStatus
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local SendInviteButton = Roact.PureComponent:extend("SendInviteButton")
SendInviteButton.validateProps = T.strictInterface({
	onActivated = T.callback,
	animationBegun = T.callback,
	animationEnded = T.callback,
	userInviteStatus = T.optional(T.string)
})

local function _(p1, p2: number, p3: number): number
	return (p1 - p2 / 30) / ((p3 - p2) / 30)
end

local _ = function(p1, p2: number, p3: number): boolean
	return p2 / 30 <= p1 and p1 <= p3 / 30
end

local config = {
	[InviteStatus.Pending] = function(p1: number, p2)
		p2.sendTransparency(math.sin(6.283185307179586 * p1) * 0.375 + 0.375)
	end,
	[InviteStatus.Success] = function(p1: number, Bindings, Callback: () -> ())
		if p1 >= 0 and p1 <= 0.13333333333333333 then
			local v1 = (p1 - 0) / 0.13333333333333333
			Bindings.sendTransparency(v1)
			Bindings.successTransparency(1 - v1)
			Bindings.successSize(0.75 + 0.75 * (1 - v1))
			
			return
		end
		if p1 >= 0.13333333333333333 and p1 <= 0.3 then
			Bindings.sendTransparency(1)
			Bindings.successTransparency(0)
			Bindings.successSize(0.75 + 0.25 * ((p1 - 0.13333333333333333) / 0.16666666666666666))
			
			return
		else
			Bindings.successSize(1)
			Callback()
		end
	end,
	[InviteStatus.Failed] = function(p1: number, Bindings, Callback: () -> ())
		if p1 >= 0 and p1 <= 0.06666666666666667 then
			Bindings.sendTransparency((p1 - 0) / 0.13333333333333333)
		elseif p1 >= 0.06666666666666667 and p1 <= 1.7333333333333334 then
			Bindings.sendTransparency(1)
		elseif p1 >= 1.7333333333333334 and p1 <= 1.9 then
			Bindings.sendTransparency(1 - (p1 - 1.7333333333333334) / 0.16666666666666666)
		else
			Bindings.sendTransparency(0)
			Callback()
		end
		if p1 >= 0 and p1 <= 0.13333333333333333 then
			Bindings.failTransparency(1 - (p1 - 0) / 0.13333333333333333)
			
			return
		end
		if p1 >= 0.13333333333333333 and p1 <= 1.4 then
			Bindings.failTransparency(0)
			local v1 = p1 - 0.13333333333333333
			Bindings.failPos(-0.4 * 2.71828182846 ^ (-v1 * 8) * math.sin(v1 * 40))
			
			return
		end
		if p1 >= 1.4 and p1 <= 1.5666666666666667 then
			Bindings.failPos(0)
			Bindings.failTransparency((p1 - 1.4) / 0.16666666666666666)
			
			return
		else
			Bindings.failTransparency(1)
		end
	end
}

function SendInviteButton.init(p1, p2)
	-- upvalues: Roact (copy), InviteStatus (copy)
	local Binding, Binding2 = Roact.createBinding(0)
	local Binding1, Binding2_1 = Roact.createBinding(1)
	local Binding3, Binding2_2 = Roact.createBinding(1)
	local Binding4, Binding2_3 = Roact.createBinding(1)
	local Binding5, Binding2_4 = Roact.createBinding(0)
	p1.bindings = {
		sendTransparency = Binding,
		successTransparency = Binding1,
		failTransparency = Binding3,
		successSize = Binding4:map(function(XScale): UDim2
			return UDim2.new(XScale, 0, XScale, 0)
		end),
		failPos = Binding5:map(function(XScale): UDim2
			return UDim2.new(XScale, 0, 0, 0)
		end)
	}
	p1.updateBindings = {
		sendTransparency = Binding2,
		successTransparency = Binding2_1,
		failTransparency = Binding2_2,
		successSize = Binding2_3,
		failPos = Binding2_4
	}
	
	if p2.userInviteStatus == InviteStatus.Success then
		Binding2_1(0)
		Binding2(1)
	end
end

function SendInviteButton.renderWithSelectionCursor(p1, Callback)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), CursorKind (copy), InviteStatus (copy), ImageSetLabel (copy), Images (copy)
	local Props = p1.props
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				IconEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: Roact (upval), Callback (copy), CursorKind (upval), Props (copy), InviteStatus (upval), p1 (copy), ImageSetLabel (upval), Images (upval)
		return Roact.createElement("TextButton", {
			Selectable = false,
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Text = "",
			SelectionImageObject = Callback(CursorKind.InputFields),
			[Roact.Event.Activated] = function()
				-- upvalues: Props (upval), InviteStatus (upval), p1 (upval)
				local IsUserInviteStatusMatch = Props.userInviteStatus == InviteStatus.Pending
				local IsUserInviteStatusMatch1 = Props.userInviteStatus == InviteStatus.Success
				
				if not p1.renderSteppedConnection and not IsUserInviteStatusMatch and not IsUserInviteStatusMatch1 then
					Props.onActivated()
				end
			end
		}, {
			SendLabel = Roact.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = Images["icons/actions/friends/friendInvite"],
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = p1.bindings.sendTransparency
			}),
			SuccessLabel = Roact.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = Images["icons/status/success"],
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = p1.bindings.successTransparency,
				Size = p1.bindings.successSize
			}),
			FailLabel = Roact.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = Images["icons/status/alert"],
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = p1.bindings.failTransparency,
				Position = p1.bindings.failPos
			})
		})
	end)
end

function SendInviteButton.render(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function SendInviteButton.didUpdate(p1, p2)
	-- upvalues: config (copy)
	if p1.props.userInviteStatus and p1.props.userInviteStatus ~= p2.userInviteStatus then
		p1:playAnimation(config[p1.props.userInviteStatus])
	end
end

function SendInviteButton.didMount(p1)
	-- upvalues: config (copy)
	if p1.props.userInviteStatus then
		p1:playAnimation(config[p1.props.userInviteStatus])
	end
end

function SendInviteButton.playAnimation(p1, AnimationFunction)
	-- upvalues: RunService (copy)
	p1.animationStartTime = tick()
	p1.animationFunction = AnimationFunction
	
	if not p1.renderSteppedConnection then
		p1.renderSteppedConnection = RunService.RenderStepped:Connect(function()
			-- upvalues: p1 (copy)
			p1.animationFunction(tick() - p1.animationStartTime, p1.updateBindings, function()
				-- upvalues: p1 (upval)
				p1:stopAnimation()
			end)
		end)
		p1.props.animationBegun()
	end
end

function SendInviteButton.stopAnimation(p1)
	if p1.renderSteppedConnection then
		p1.renderSteppedConnection:Disconnect()
		p1.renderSteppedConnection = nil
		p1.props.animationEnded()
	end
end

function SendInviteButton.willUnmount(p1)
	p1:stopAnimation()
end

return SendInviteButton