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

function healthConnector.init(p1)
	p1:setState({ character = nil, humanoid = nil })
end

function healthConnector.didMount(p1)
	-- upvalues: localPlayer (write)
	local character = localPlayer.Character
	p1:setState({
		character = character,
		humanoid = if character then character:FindFirstChildOfClass("Humanoid") else nil
	})
end

function healthConnector.render(p1)
	-- upvalues: roactModule (ref), eventConnectionModule (ref), localPlayer (write)
	local t = {}
	
	if p1.state.humanoid then
		t.HealthChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = p1.state.humanoid.HealthChanged,
			callback = function(_)
				-- upvalues: p1 (ref)
				p1.props.updateHealth(p1.state.humanoid.Health, p1.state.humanoid.MaxHealth)
			end
		})
		t.HumanoidDiedConnection = roactModule.createElement(eventConnectionModule, {
			event = p1.state.humanoid.Died,
			callback = function()
				-- upvalues: p1 (ref)
				p1.props.setIsDead(true)
			end
		})
	elseif p1.state.character then
		t.ChildAddedConnection = roactModule.createElement(eventConnectionModule, {
			event = p1.state.character.ChildAdded,
			callback = function(p2)
				-- upvalues: p1 (ref)
				if p2:IsA("Humanoid") then
					p1:setState({ humanoid = p2 })
				end
			end
		})
	end
	t.CharacterAddedConnection = roactModule.createElement(eventConnectionModule, {
		event = localPlayer.CharacterAdded,
		callback = function(p2)
			-- upvalues: p1 (ref), roactModule (copy)
			p1:setState({
				humanoid = p2:FindFirstChildOfClass("Humanoid") or roactModule.None,
				character = p2
			})
			p1.props.setIsDead(false)
		end
	})
	t.CharacterRemovingConnection = roactModule.createElement(eventConnectionModule, {
		event = localPlayer.CharacterRemoving,
		callback = function()
			-- upvalues: p1 (ref), roactModule (copy)
			p1:setState({
				humanoid = roactModule.None,
				character = roactModule.None
			})
		end
	})
	
	return roactModule.createFragment(t)
end

function healthConnector.didUpdate(p1, _, p2)
	if p1.state.humanoid == nil then
		p1.props.updateHealth(0, 0)
	elseif p1.state.humanoid ~= p2.humanoid then
		p1.props.setIsDead(false)
		p1.props.updateHealth(p1.state.humanoid.Health, p1.state.humanoid.MaxHealth)
	end
	if p1.state.character and p1.state.character ~= p2.character then
		local humanoid = p1.state.character:FindFirstChildWhichIsA("Humanoid")
		
		if humanoid and humanoid ~= p1.state.humanoid then
			p1:setState({ humanoid = humanoid })
		end
	end
end

return if fFlagTopBarSignalizeHealthBar then nil else roactRoduxModule.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: setIsDeadModule (ref), updateHealthModule (ref)
	return {
		setIsDead = function(value)
			-- upvalues: p1 (ref), setIsDeadModule (copy)
			return p1(setIsDeadModule(value))
		end,
		updateHealth = function(p2, p3)
			-- upvalues: p1 (ref), updateHealthModule (copy)
			return p1(updateHealthModule(p2, p3))
		end
	}
end)(healthConnector)