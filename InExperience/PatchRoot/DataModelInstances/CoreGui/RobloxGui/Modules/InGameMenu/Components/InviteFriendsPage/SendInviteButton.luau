local runService = game:GetService("RunService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local inviteStatus = require(script.Parent.Parent.Parent.Resources.Constants).InviteStatus
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local sendInviteButton = roact.PureComponent:extend("SendInviteButton")
sendInviteButton.validateProps = t.strictInterface({
	onActivated = t.callback,
	animationBegun = t.callback,
	animationEnded = t.callback,
	userInviteStatus = t.optional(t.string)
})

local function _(p0, p1, p2) --[[ line: 35 | named "linearTween" ]]
	return (p0 - p1 / 30) / ((p2 - p1) / 30)
end

local _ = function(p3, p4, p5) --[[ line: 40 | named "isBetweenFrames" ]]
	return p4 / 30 <= p3 and p3 <= p5 / 30
end

local t_1 = {
	[inviteStatus.Pending] = function(p6, p7) --[[ line: 45 ]]
		p7.sendTransparency(math.sin(6.28318530718 * p6) * 0.375 + 0.375)
	end,
	[inviteStatus.Success] = function(p8, p9, p10) --[[ line: 54 ]]
		if p8 >= 0 and p8 <= 0.133333333333 then
			local var4 = (p8 - 0) / 0.133333333333
			p9.sendTransparency(var4)
			p9.successTransparency(1 - var4)
			p9.successSize(0.75 + 0.75 * (1 - var4))
			
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
	[inviteStatus.Failed] = function(p11, p12, p13) --[[ line: 85 ]]
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
			local var5 = p11 - 0.133333333333
			p12.failPos(-0.4 * 2.71828182846 ^ (-var5 * 8) * math.sin(var5 * 40))
			
			return
		elseif p11 >= 1.4 and p11 <= 1.566666666667 then
			p12.failPos(0)
			p12.failTransparency((p11 - 1.4) / 0.166666666667)
			
			return
		end
		p12.failTransparency(1)
	end
}

function sendInviteButton.init(p14, p15) --[[ line: 142 ]]
	-- upvalues: roact (ref), inviteStatus (ref)
	local var6, var7 = roact.createBinding(0)
	local var8, var9 = roact.createBinding(1)
	local var10, var11 = roact.createBinding(1)
	local var12, var13 = roact.createBinding(1)
	local var14, var15 = roact.createBinding(0)
	p14.bindings = {
		sendTransparency = var6,
		successTransparency = var8,
		failTransparency = var10,
		successSize = var12:map(function(p16) --[[ line: 154 ]]
			return UDim2.new(p16, 0, p16, 0)
		end),
		failPos = var14:map(function(p17) --[[ line: 157 ]]
			return UDim2.new(p17, 0, 0, 0)
		end)
	}
	p14.updateBindings = {
		sendTransparency = var7,
		successTransparency = var9,
		failTransparency = var11,
		successSize = var13,
		failPos = var15
	}
	
	if p15.userInviteStatus == inviteStatus.Success then
		var9(0)
		var7(1)
	end
end

function sendInviteButton.renderWithSelectionCursor(p18, p19) --[[ line: 176 ]]
	-- upvalues: withStyle (ref), roact (ref), cursorKind (ref), inviteStatus (ref), imageSetLabel (ref), images (ref)
	local props = p18.props
	
	return withStyle(function(p20) --[[ line: 179 ]]
		-- upvalues: roact (copy), p19 (ref), cursorKind (copy), props (ref), inviteStatus (copy), p18 (ref), imageSetLabel (copy), images (copy)
		return roact.createElement("TextButton", {
			Selectable = false,
			Size = UDim2.new(0, 36, 0, 36),
			BackgroundTransparency = 1,
			Text = "",
			SelectionImageObject = p19(cursorKind.InputFields),
			[roact.Event.Activated] = function() --[[ line: 187 ]]
				-- upvalues: props (copy), inviteStatus (copy), p18 (copy)
				if not p18.renderSteppedConnection and not (props.userInviteStatus == inviteStatus.Pending) and not (props.userInviteStatus == inviteStatus.Success) then
					props.onActivated()
				end
			end
		}, {
			SendLabel = roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images["icons/actions/friends/friendInvite"],
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p20.Theme.IconEmphasis.Color,
				ImageTransparency = p18.bindings.sendTransparency
			}),
			SuccessLabel = roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images["icons/status/success"],
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageColor3 = p20.Theme.IconEmphasis.Color,
				ImageTransparency = p18.bindings.successTransparency,
				Size = p18.bindings.successSize
			}),
			FailLabel = roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = images["icons/status/alert"],
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p20.Theme.IconEmphasis.Color,
				ImageTransparency = p18.bindings.failTransparency,
				Position = p18.bindings.failPos
			})
		})
	end)
end

function sendInviteButton.render(p21) --[[ line: 226 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p22) --[[ line: 227 ]]
		-- upvalues: p21 (ref)
		return p21:renderWithSelectionCursor(p22)
	end)
end

function sendInviteButton.didUpdate(p23, p24) --[[ line: 232 ]]
	-- upvalues: t_1 (ref)
	if p23.props.userInviteStatus and p23.props.userInviteStatus ~= p24.userInviteStatus then
		p23:playAnimation(t_1[p23.props.userInviteStatus])
	end
end

function sendInviteButton.didMount(p25) --[[ line: 238 ]]
	-- upvalues: t_1 (ref)
	if p25.props.userInviteStatus then
		p25:playAnimation(t_1[p25.props.userInviteStatus])
	end
end

function sendInviteButton.playAnimation(p26, p27) --[[ line: 244 ]]
	-- upvalues: runService (ref)
	p26.animationStartTime = tick()
	p26.animationFunction = p27
	
	if not p26.renderSteppedConnection then
		p26.renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 249 ]]
			-- upvalues: p26 (ref)
			p26.animationFunction(tick() - p26.animationStartTime, p26.updateBindings, function() --[[ line: 250 ]]
				-- upvalues: p26 (copy)
				p26:stopAnimation()
			end)
		end)
		p26.props.animationBegun()
	end
end

function sendInviteButton.stopAnimation(p28) --[[ line: 258 ]]
	if p28.renderSteppedConnection then
		p28.renderSteppedConnection:Disconnect()
		p28.renderSteppedConnection = nil
		p28.props.animationEnded()
	end
end

function sendInviteButton.willUnmount(p29) --[[ line: 266 ]]
	p29:stopAnimation()
end

return sendInviteButton