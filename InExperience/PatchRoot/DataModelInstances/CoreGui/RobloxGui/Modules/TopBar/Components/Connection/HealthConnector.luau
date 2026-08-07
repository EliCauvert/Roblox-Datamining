local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent.Parent
local fFlagTopBarSignalizeHealthBar = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local setIsDeadModule = require(parent.Actions.SetIsDead)
local updateHealthModule = require(parent.Actions.UpdateHealth)
local eventConnectionModule = require(parent.Parent.Common.EventConnection)
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local healthConnector = roactModule.PureComponent:extend("HealthConnector")
healthConnector.validateProps = tModule.strictInterface({
	setIsDead = tModule.callback,
	updateHealth = tModule.callback
})

function healthConnector.init(p0) --[[ line: 34 ]]
	p0:setState({ character = nil, humanoid = nil })
end

function healthConnector.didMount(p1) --[[ line: 41 ]]
	-- upvalues: localPlayer (write)
	local character = localPlayer.Character
	p1:setState({
		character = character,
		humanoid = if character then character:FindFirstChildOfClass("Humanoid") else nil
	})
end

function healthConnector.render(p2) --[[ line: 54 ]]
	-- upvalues: roactModule (ref), eventConnectionModule (ref), localPlayer (write)
	local t = {}
	
	if p2.state.humanoid then
		t.HealthChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = p2.state.humanoid.HealthChanged,
			callback = function(_) --[[ line: 60 ]]
				-- upvalues: p2 (ref)
				p2.props.updateHealth(p2.state.humanoid.Health, p2.state.humanoid.MaxHealth)
			end
		})
		t.HumanoidDiedConnection = roactModule.createElement(eventConnectionModule, {
			event = p2.state.humanoid.Died,
			callback = function() --[[ line: 67 ]]
				-- upvalues: p2 (ref)
				p2.props.setIsDead(true)
			end
		})
	elseif p2.state.character then
		t.ChildAddedConnection = roactModule.createElement(eventConnectionModule, {
			event = p2.state.character.ChildAdded,
			callback = function(p3) --[[ line: 74 ]]
				-- upvalues: p2 (ref)
				if p3:IsA("Humanoid") then
					p2:setState({ humanoid = p3 })
				end
			end
		})
	end
	t.CharacterAddedConnection = roactModule.createElement(eventConnectionModule, {
		event = localPlayer.CharacterAdded,
		callback = function(p4) --[[ line: 86 ]]
			-- upvalues: p2 (ref), roactModule (copy)
			p2:setState({
				humanoid = p4:FindFirstChildOfClass("Humanoid") or roactModule.None,
				character = p4
			})
			p2.props.setIsDead(false)
		end
	})
	t.CharacterRemovingConnection = roactModule.createElement(eventConnectionModule, {
		event = localPlayer.CharacterRemoving,
		callback = function() --[[ line: 97 ]]
			-- upvalues: p2 (ref), roactModule (copy)
			p2:setState({
				humanoid = roactModule.None,
				character = roactModule.None
			})
		end
	})
	
	return roactModule.createFragment(t)
end

function healthConnector.didUpdate(p5, _, p6) --[[ line: 108 ]]
	if p5.state.humanoid == nil then
		p5.props.updateHealth(0, 0)
	elseif p5.state.humanoid ~= p6.humanoid then
		p5.props.setIsDead(false)
		p5.props.updateHealth(p5.state.humanoid.Health, p5.state.humanoid.MaxHealth)
	end
	if p5.state.character and p5.state.character ~= p6.character then
		local humanoid = p5.state.character:FindFirstChildWhichIsA("Humanoid")
		
		if humanoid and humanoid ~= p5.state.humanoid then
			p5:setState({ humanoid = humanoid })
		end
	end
end

return if fFlagTopBarSignalizeHealthBar then nil else roactRoduxModule.UNSTABLE_connect2(nil, function(p7) --[[ line: 126 | named "mapDispatchToProps" ]]
	-- upvalues: setIsDeadModule (ref), updateHealthModule (ref)
	return {
		setIsDead = function(value) --[[ line: 128 ]]
			-- upvalues: p7 (ref), setIsDeadModule (copy)
			return p7(setIsDeadModule(value))
		end,
		updateHealth = function(p8, p9) --[[ line: 132 ]]
			-- upvalues: p7 (ref), updateHealthModule (copy)
			return p7(updateHealthModule(p8, p9))
		end
	}
end)(healthConnector)