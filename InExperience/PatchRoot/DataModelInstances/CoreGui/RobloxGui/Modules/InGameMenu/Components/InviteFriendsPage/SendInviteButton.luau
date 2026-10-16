local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local InviteStatus = require(script.Parent.Parent.Parent.Resources.Constants).InviteStatus
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local IconSize = FoundationModule.Enums.IconSize
local SendInviteButton = Roact.PureComponent:extend("SendInviteButton")
SendInviteButton.validateProps = T.strictInterface({
	onActivated = T.callback,
	animationBegun = T.callback,
	animationEnded = T.callback,
	userInviteStatus = T.optional(T.string)
})

local function _(p1, p2: number, p3: number): number --[[ Line: 47 | Named "linearTween" ]]
	return (p1 - p2 / 30) / ((p3 - p2) / 30)
end

local _ = function(p1, p2: number, p3: number): boolean --[[ Line: 52 | Named "isBetweenFrames" ]]
	return p2 / 30 <= p1 and p1 <= p3 / 30
end

local config = {
	[InviteStatus.Pending] = function(p1: number, p2) --[[ Line: 57 ]]
		p2.sendTransparency(math.sin(6.283185307179586 * p1) * 0.375 + 0.375)
	end,
	[InviteStatus.Success] = function(p1: number, Bindings, Callback: () -> ()) --[[ Line: 66 ]]
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
	[InviteStatus.Failed] = function(p1: number, Bindings, Callback: () -> ()) --[[ Line: 97 ]]
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

function SendInviteButton.init(p1, p2) --[[ Line: 154 ]]
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
		successSize = Binding4:map(function(XScale): UDim2 --[[ Line: 166 ]]
			return UDim2.new(XScale, 0, XScale, 0)
		end),
		successScale = Binding4,
		failPos = Binding5:map(function(XScale): UDim2 --[[ Line: 170 ]]
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

function SendInviteButton.renderWithSelectionCursor(p1, Callback) --[[ Line: 189 ]]
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), CursorType (copy), InviteStatus (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Icon (copy), IconName (copy), IconVariant (copy), IconSize (copy), ImageSetLabel (copy), Images (copy)
	local Props = p1.props
	
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 192 ]]
		return {
			Theme = {
				IconEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				}
			},
			IconSize = p2.Size.Size_800
		}
	end, function(p2) --[[ Line: 199 ]]
		-- upvalues: Roact (upval), Callback (copy), CursorType (upval), Props (copy), InviteStatus (upval), p1 (copy), FFlagCoreUiMigrateUIBloxToFoundation (upval), Icon (upval), IconName (upval), IconVariant (upval), IconSize (upval), ImageSetLabel (upval), Images (upval)
		return Roact.createElement("TextButton", {
			Selectable = false,
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Text = "",
			SelectionImageObject = Callback(CursorType.InputFields),
			[Roact.Event.Activated] = function() --[[ Line: 207 ]]
				-- upvalues: Props (upval), InviteStatus (upval), p1 (upval)
				local IsUserInviteStatusMatch = Props.userInviteStatus == InviteStatus.Pending
				local IsUserInviteStatusMatch1 = Props.userInviteStatus == InviteStatus.Success
				
				if not p1.renderSteppedConnection and not IsUserInviteStatusMatch and not IsUserInviteStatusMatch1 then
					Props.onActivated()
				end
			end
		}, {
			SendLabel = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Icon, {
				name = IconName.PersonArrowFromBottomRight,
				variant = IconVariant.Regular,
				size = IconSize.XXLarge,
				style = p1.bindings.sendTransparency:map(function(Transparency) --[[ Line: 220 ]]
					-- upvalues: p2 (copy)
					return {
						Color3 = p2.Theme.IconEmphasis.Color,
						Transparency = Transparency
					}
				end)
			}) else Roact.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = Images["icons/actions/friends/friendInvite"],
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = p1.bindings.sendTransparency
			}),
			SuccessLabel = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Icon, {
				name = IconName.CheckLarge,
				variant = IconVariant.Filled,
				size = p1.bindings.successScale:map(function(p3) --[[ Line: 236 ]]
					-- upvalues: p2 (copy)
					return p2.IconSize * p3
				end),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				style = p1.bindings.successTransparency:map(function(Transparency) --[[ Line: 241 ]]
					-- upvalues: p2 (copy)
					return {
						Color3 = p2.Theme.IconEmphasis.Color,
						Transparency = Transparency
					}
				end)
			}) else Roact.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = Images["icons/status/success"],
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = p1.bindings.successTransparency,
				Size = p1.bindings.successSize
			}),
			FailLabel = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Icon, {
				name = IconName.TriangleExclamation,
				variant = IconVariant.Filled,
				size = IconSize.XXLarge,
				style = p1.bindings.failTransparency:map(function(Transparency) --[[ Line: 260 ]]
					-- upvalues: p2 (copy)
					return {
						Color3 = p2.Theme.IconEmphasis.Color,
						Transparency = Transparency
					}
				end),
				Position = p1.bindings.failPos
			}) else Roact.createElement(ImageSetLabel, {
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

function SendInviteButton.render(p1) --[[ Line: 278 ]]
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2) --[[ Line: 279 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function SendInviteButton.didUpdate(p1, p2) --[[ Line: 284 ]]
	-- upvalues: config (copy)
	if p1.props.userInviteStatus and p1.props.userInviteStatus ~= p2.userInviteStatus then
		p1:playAnimation(config[p1.props.userInviteStatus])
	end
end

function SendInviteButton.didMount(p1) --[[ Line: 290 ]]
	-- upvalues: config (copy)
	if p1.props.userInviteStatus then
		p1:playAnimation(config[p1.props.userInviteStatus])
	end
end

function SendInviteButton.playAnimation(p1, AnimationFunction) --[[ Line: 296 ]]
	-- upvalues: RunService (copy)
	p1.animationStartTime = tick()
	p1.animationFunction = AnimationFunction
	
	if not p1.renderSteppedConnection then
		p1.renderSteppedConnection = RunService.RenderStepped:Connect(function() --[[ Line: 301 ]]
			-- upvalues: p1 (copy)
			p1.animationFunction(tick() - p1.animationStartTime, p1.updateBindings, function() --[[ Line: 302 ]]
				-- upvalues: p1 (upval)
				p1:stopAnimation()
			end)
		end)
		p1.props.animationBegun()
	end
end

function SendInviteButton.stopAnimation(p1) --[[ Line: 310 ]]
	if p1.renderSteppedConnection then
		p1.renderSteppedConnection:Disconnect()
		p1.renderSteppedConnection = nil
		p1.props.animationEnded()
	end
end

function SendInviteButton.willUnmount(p1) --[[ Line: 318 ]]
	p1:stopAnimation()
end

return SendInviteButton