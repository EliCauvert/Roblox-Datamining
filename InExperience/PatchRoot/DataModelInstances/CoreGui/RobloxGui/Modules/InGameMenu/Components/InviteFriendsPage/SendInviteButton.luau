local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var5 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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

local function _(p0, p1, p2) --[[ line: 47 | named "linearTween" ]]
	return (p0 - p1 / 30) / ((p2 - p1) / 30)
end

local _ = function(p3, p4, p5) --[[ line: 52 | named "isBetweenFrames" ]]
	return p4 / 30 <= p3 and p3 <= p5 / 30
end

local t_1 = {
	[inviteStatus.Pending] = function(p6, p7) --[[ line: 57 ]]
		p7.sendTransparency(math.sin(6.28318530718 * p6) * 0.375 + 0.375)
	end,
	[inviteStatus.Success] = function(p8, p9, p10) --[[ line: 66 ]]
		if p8 >= 0 and p8 <= 0.133333333333 then
			local var8 = (p8 - 0) / 0.133333333333
			p9.sendTransparency(var8)
			p9.successTransparency(1 - var8)
			p9.successSize(0.75 + 0.75 * (1 - var8))
			
			return
		elseif p8 >= 0.133333333333 and p8 <= 0.3 then
			p9.sendTransparency(1)
			p9.successTransparency(0)
			p9.successSize(0.75 + 0.25 * ((p8 - 0.133333333333) / 0.166666666667))
			
			return
		end
		p9.successSize(1)
		p10()
	end,
	[inviteStatus.Failed] = function(p11, p12, p13) --[[ line: 97 ]]
		if p11 >= 0 and p11 <= 0.066666666667 then
			p12.sendTransparency((p11 - 0) / 0.133333333333)
		elseif p11 >= 0.066666666667 and p11 <= 1.733333333333 then
			p12.sendTransparency(1)
		elseif p11 >= 1.733333333333 and p11 <= 1.9 then
			p12.sendTransparency(1 - (p11 - 1.733333333333) / 0.166666666667)
		else
			p12.sendTransparency(0)
			p13()
		end
		if p11 >= 0 and p11 <= 0.133333333333 then
			p12.failTransparency(1 - (p11 - 0) / 0.133333333333)
			
			return
		elseif p11 >= 0.133333333333 and p11 <= 1.4 then
			p12.failTransparency(0)
			local var9 = p11 - 0.133333333333
			p12.failPos(-0.4 * 2.71828182846 ^ (-var9 * 8) * math.sin(var9 * 40))
			
			return
		elseif p11 >= 1.4 and p11 <= 1.566666666667 then
			p12.failPos(0)
			p12.failTransparency((p11 - 1.4) / 0.166666666667)
			
			return
		end
		p12.failTransparency(1)
	end
}

function sendInviteButton.init(p14, p15) --[[ line: 154 ]]
	-- upvalues: roact (ref), inviteStatus (ref)
	local var10, var11 = roact.createBinding(0)
	local var12, var13 = roact.createBinding(1)
	local var14, var15 = roact.createBinding(1)
	local var16, var17 = roact.createBinding(1)
	local var18, var19 = roact.createBinding(0)
	p14.bindings = {
		sendTransparency = var10,
		successTransparency = var12,
		failTransparency = var14,
		successSize = var16:map(function(p16) --[[ line: 166 ]]
			return UDim2.new(p16, 0, p16, 0)
		end),
		successScale = var16,
		failPos = var18:map(function(p17) --[[ line: 170 ]]
			return UDim2.new(p17, 0, 0, 0)
		end)
	}
	p14.updateBindings = {
		sendTransparency = var11,
		successTransparency = var13,
		failTransparency = var15,
		successSize = var17,
		failPos = var19
	}
	
	if p15.userInviteStatus == inviteStatus.Success then
		var13(0)
		var11(1)
	end
end

function sendInviteButton.renderWithSelectionCursor(p18, p19) --[[ line: 189 ]]
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), var5 (ref), inviteStatus (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), imageSetLabel (ref), images (ref)
	local props = p18.props
	
	return withFoundationOrUIBloxStyle(function(p20) --[[ line: 192 ]]
		return {
			Theme = {
				IconEmphasis = {
					Color = p20.Color.Content.Emphasis.Color3,
					Transparency = p20.Color.Content.Emphasis.Transparency
				}
			},
			IconSize = p20.Size.Size_800
		}
	end, function(p21) --[[ line: 199 ]]
		-- upvalues: roact (copy), p19 (ref), var5 (copy), props (ref), inviteStatus (copy), p18 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), icon (copy), iconName (copy), iconVariant (copy), iconSize (copy), imageSetLabel (copy), images (copy)
		return roact.createElement("TextButton", {
			Selectable = false,
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Text = "",
			SelectionImageObject = p19(var5.InputFields),
			[roact.Event.Activated] = function() --[[ line: 207 ]]
				-- upvalues: props (copy), inviteStatus (copy), p18 (copy)
				if not p18.renderSteppedConnection and not (props.userInviteStatus == inviteStatus.Pending) and not (props.userInviteStatus == inviteStatus.Success) then
					props.onActivated()
				end
			end
		}, {
			SendLabel = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(icon, {
				name = iconName.PersonArrowFromBottomRight,
				variant = iconVariant.Regular,
				size = iconSize.XXLarge,
				style = p18.bindings.sendTransparency:map(function(p22) --[[ line: 220 ]]
					-- upvalues: p21 (ref)
					return {
						Color3 = p21.Theme.IconEmphasis.Color,
						Transparency = p22
					}
				end)
			}) else roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images["icons/actions/friends/friendInvite"],
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p21.Theme.IconEmphasis.Color,
				ImageTransparency = p18.bindings.sendTransparency
			}),
			SuccessLabel = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(icon, {
				name = iconName.CheckLarge,
				variant = iconVariant.Filled,
				size = p18.bindings.successScale:map(function(p23) --[[ line: 236 ]]
					-- upvalues: p21 (ref)
					return p21.IconSize * p23
				end),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				style = p18.bindings.successTransparency:map(function(p24) --[[ line: 241 ]]
					-- upvalues: p21 (ref)
					return {
						Color3 = p21.Theme.IconEmphasis.Color,
						Transparency = p24
					}
				end)
			}) else roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images["icons/status/success"],
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = p21.Theme.IconEmphasis.Color,
				ImageTransparency = p18.bindings.successTransparency,
				Size = p18.bindings.successSize
			}),
			FailLabel = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(icon, {
				name = iconName.TriangleExclamation,
				variant = iconVariant.Filled,
				size = iconSize.XXLarge,
				style = p18.bindings.failTransparency:map(function(p25) --[[ line: 260 ]]
					-- upvalues: p21 (ref)
					return {
						Color3 = p21.Theme.IconEmphasis.Color,
						Transparency = p25
					}
				end),
				Position = p18.bindings.failPos
			}) else roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images["icons/status/alert"],
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p21.Theme.IconEmphasis.Color,
				ImageTransparency = p18.bindings.failTransparency,
				Position = p18.bindings.failPos
			})
		})
	end)
end

function sendInviteButton.render(p26) --[[ line: 278 ]]
	-- upvalues: var4 (ref)
	return var4(function(p27) --[[ line: 279 ]]
		-- upvalues: p26 (ref)
		return p26:renderWithSelectionCursor(p27)
	end)
end

function sendInviteButton.didUpdate(p28, p29) --[[ line: 284 ]]
	-- upvalues: t_1 (ref)
	if p28.props.userInviteStatus and p28.props.userInviteStatus ~= p29.userInviteStatus then
		p28:playAnimation(t_1[p28.props.userInviteStatus])
	end
end

function sendInviteButton.didMount(p30) --[[ line: 290 ]]
	-- upvalues: t_1 (ref)
	if p30.props.userInviteStatus then
		p30:playAnimation(t_1[p30.props.userInviteStatus])
	end
end

function sendInviteButton.playAnimation(p31, p32) --[[ line: 296 ]]
	-- upvalues: runService (ref)
	p31.animationStartTime = tick()
	p31.animationFunction = p32
	
	if not p31.renderSteppedConnection then
		p31.renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 301 ]]
			-- upvalues: p31 (ref)
			p31.animationFunction(tick() - p31.animationStartTime, p31.updateBindings, function() --[[ line: 302 ]]
				-- upvalues: p31 (copy)
				p31:stopAnimation()
			end)
		end)
		p31.props.animationBegun()
	end
end

function sendInviteButton.stopAnimation(p33) --[[ line: 310 ]]
	if p33.renderSteppedConnection then
		p33.renderSteppedConnection:Disconnect()
		p33.renderSteppedConnection = nil
		p33.props.animationEnded()
	end
end

function sendInviteButton.willUnmount(p34) --[[ line: 318 ]]
	p34:stopAnimation()
end

return sendInviteButton