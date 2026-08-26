local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local inviteStatus = require(script.Parent.Parent.Parent.Resources.Constants).InviteStatus
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local iconSize = foundationModule.Enums.IconSize
local sendInviteButton = roact.PureComponent:extend("SendInviteButton")
sendInviteButton.validateProps = t.strictInterface({
	onActivated = t.callback,
	animationBegun = t.callback,
	animationEnded = t.callback,
	userInviteStatus = t.optional(t.string)
})

local function _(p1, p2, p3)
	return (p1 - p2 / 30) / ((p3 - p2) / 30)
end

local _ = function(p1, p2, p3)
	return p2 / 30 <= p1 and p1 <= p3 / 30
end

local t_1 = {
	[inviteStatus.Pending] = function(p1, p2)
		p2.sendTransparency(math.sin(6.28318530718 * p1) * 0.375 + 0.375)
	end,
	[inviteStatus.Success] = function(p1, p2, p3)
		if p1 >= 0 and p1 <= 0.133333333333 then
			local var3 = (p1 - 0) / 0.133333333333
			p2.sendTransparency(var3)
			p2.successTransparency(1 - var3)
			p2.successSize(0.75 + 0.75 * (1 - var3))
			
			return
		elseif p1 >= 0.133333333333 and p1 <= 0.3 then
			p2.sendTransparency(1)
			p2.successTransparency(0)
			p2.successSize(0.75 + 0.25 * ((p1 - 0.133333333333) / 0.166666666667))
			
			return
		end
		p2.successSize(1)
		p3()
	end,
	[inviteStatus.Failed] = function(p1, p2, p3)
		if p1 >= 0 and p1 <= 0.066666666667 then
			p2.sendTransparency((p1 - 0) / 0.133333333333)
		elseif p1 >= 0.066666666667 and p1 <= 1.733333333333 then
			p2.sendTransparency(1)
		elseif p1 >= 1.733333333333 and p1 <= 1.9 then
			p2.sendTransparency(1 - (p1 - 1.733333333333) / 0.166666666667)
		else
			p2.sendTransparency(0)
			p3()
		end
		if p1 >= 0 and p1 <= 0.133333333333 then
			p2.failTransparency(1 - (p1 - 0) / 0.133333333333)
			
			return
		elseif p1 >= 0.133333333333 and p1 <= 1.4 then
			p2.failTransparency(0)
			local var3 = p1 - 0.133333333333
			p2.failPos(-0.4 * 2.71828182846 ^ (-var3 * 8) * math.sin(var3 * 40))
			
			return
		elseif p1 >= 1.4 and p1 <= 1.566666666667 then
			p2.failPos(0)
			p2.failTransparency((p1 - 1.4) / 0.166666666667)
			
			return
		end
		p2.failTransparency(1)
	end
}

function sendInviteButton.init(p1, p2)
	-- upvalues: roact (ref), inviteStatus (ref)
	local var3, var4 = roact.createBinding(0)
	local var5, var6 = roact.createBinding(1)
	local var7, var8 = roact.createBinding(1)
	local var9, var10 = roact.createBinding(1)
	local var11, var12 = roact.createBinding(0)
	p1.bindings = {
		sendTransparency = var3,
		successTransparency = var5,
		failTransparency = var7,
		successSize = var9:map(function(p3)
			return UDim2.new(p3, 0, p3, 0)
		end),
		successScale = var9,
		failPos = var11:map(function(p3)
			return UDim2.new(p3, 0, 0, 0)
		end)
	}
	p1.updateBindings = {
		sendTransparency = var4,
		successTransparency = var6,
		failTransparency = var8,
		successSize = var10,
		failPos = var12
	}
	
	if p2.userInviteStatus == inviteStatus.Success then
		var6(0)
		var4(1)
	end
end

function sendInviteButton.renderWithSelectionCursor(p1, p2)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), var2 (ref), inviteStatus (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), imageSetLabel (ref), images (ref)
	local props = p1.props
	
	return withFoundationOrUIBloxStyle(function(p3)
		return {
			Theme = {
				IconEmphasis = {
					Color = p3.Color.Content.Emphasis.Color3,
					Transparency = p3.Color.Content.Emphasis.Transparency
				}
			},
			IconSize = p3.Size.Size_800
		}
	end, function(p3)
		-- upvalues: roact (copy), p2 (ref), var2 (copy), props (ref), inviteStatus (copy), p1 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), icon (copy), iconName (copy), iconVariant (copy), iconSize (copy), imageSetLabel (copy), images (copy)
		return roact.createElement("TextButton", {
			Selectable = false,
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Text = "",
			SelectionImageObject = p2(var2.InputFields),
			[roact.Event.Activated] = function()
				-- upvalues: props (copy), inviteStatus (copy), p1 (copy)
				if not p1.renderSteppedConnection and not (props.userInviteStatus == inviteStatus.Pending) and not (props.userInviteStatus == inviteStatus.Success) then
					props.onActivated()
				end
			end
		}, {
			SendLabel = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(icon, {
				name = iconName.PersonArrowFromBottomRight,
				variant = iconVariant.Regular,
				size = iconSize.XXLarge,
				style = p1.bindings.sendTransparency:map(function(p4)
					-- upvalues: p3 (ref)
					return {
						Color3 = p3.Theme.IconEmphasis.Color,
						Transparency = p4
					}
				end)
			}) else roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images["icons/actions/friends/friendInvite"],
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p3.Theme.IconEmphasis.Color,
				ImageTransparency = p1.bindings.sendTransparency
			}),
			SuccessLabel = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(icon, {
				name = iconName.CheckLarge,
				variant = iconVariant.Filled,
				size = p1.bindings.successScale:map(function(p4)
					-- upvalues: p3 (ref)
					return p3.IconSize * p4
				end),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				style = p1.bindings.successTransparency:map(function(p4)
					-- upvalues: p3 (ref)
					return {
						Color3 = p3.Theme.IconEmphasis.Color,
						Transparency = p4
					}
				end)
			}) else roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images["icons/status/success"],
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = p3.Theme.IconEmphasis.Color,
				ImageTransparency = p1.bindings.successTransparency,
				Size = p1.bindings.successSize
			}),
			FailLabel = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(icon, {
				name = iconName.TriangleExclamation,
				variant = iconVariant.Filled,
				size = iconSize.XXLarge,
				style = p1.bindings.failTransparency:map(function(p4)
					-- upvalues: p3 (ref)
					return {
						Color3 = p3.Theme.IconEmphasis.Color,
						Transparency = p4
					}
				end),
				Position = p1.bindings.failPos
			}) else roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images["icons/status/alert"],
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p3.Theme.IconEmphasis.Color,
				ImageTransparency = p1.bindings.failTransparency,
				Position = p1.bindings.failPos
			})
		})
	end)
end

function sendInviteButton.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function sendInviteButton.didUpdate(p1, p2)
	-- upvalues: t_1 (ref)
	if p1.props.userInviteStatus and p1.props.userInviteStatus ~= p2.userInviteStatus then
		p1:playAnimation(t_1[p1.props.userInviteStatus])
	end
end

function sendInviteButton.didMount(p1)
	-- upvalues: t_1 (ref)
	if p1.props.userInviteStatus then
		p1:playAnimation(t_1[p1.props.userInviteStatus])
	end
end

function sendInviteButton.playAnimation(p1, p2)
	-- upvalues: runService (ref)
	p1.animationStartTime = tick()
	p1.animationFunction = p2
	
	if not p1.renderSteppedConnection then
		p1.renderSteppedConnection = runService.RenderStepped:Connect(function()
			-- upvalues: p1 (ref)
			p1.animationFunction(tick() - p1.animationStartTime, p1.updateBindings, function()
				-- upvalues: p1 (copy)
				p1:stopAnimation()
			end)
		end)
		p1.props.animationBegun()
	end
end

function sendInviteButton.stopAnimation(p1)
	if p1.renderSteppedConnection then
		p1.renderSteppedConnection:Disconnect()
		p1.renderSteppedConnection = nil
		p1.props.animationEnded()
	end
end

function sendInviteButton.willUnmount(p1)
	p1:stopAnimation()
end

return sendInviteButton