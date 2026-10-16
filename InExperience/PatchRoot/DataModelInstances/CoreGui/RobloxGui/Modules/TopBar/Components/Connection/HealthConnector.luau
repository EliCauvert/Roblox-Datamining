local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent.Parent
local FFlagTopBarSignalizeHealthBar = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local SetIsDeadModule = require(Parent.Actions.SetIsDead)
local UpdateHealthModule = require(Parent.Actions.UpdateHealth)
local EventConnectionModule = require(Parent.Parent.Common.EventConnection)
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local HealthConnector = RoactModule.PureComponent:extend("HealthConnector")
HealthConnector.validateProps = TModule.strictInterface({
	setIsDead = TModule.callback,
	updateHealth = TModule.callback
})

function HealthConnector.init(p1) --[[ Line: 34 ]]
	p1:setState({ character = nil, humanoid = nil })
end

function HealthConnector.didMount(p1) --[[ Line: 41 ]]
	-- upvalues: LocalPlayer (ref)
	local Character = LocalPlayer.Character
	p1:setState({
		character = Character,
		humanoid = if Character then Character:FindFirstChildOfClass("Humanoid") else nil
	})
end

function HealthConnector.render(p1) --[[ Line: 54 ]]
	-- upvalues: RoactModule (copy), EventConnectionModule (copy), LocalPlayer (ref)
	local t = {}
	
	if p1.state.humanoid then
		t.HealthChangedConnection = RoactModule.createElement(EventConnectionModule, {
			event = p1.state.humanoid.HealthChanged,
			callback = function(_) --[[ Line: 60 ]]
				-- upvalues: p1 (copy)
				p1.props.updateHealth(p1.state.humanoid.Health, p1.state.humanoid.MaxHealth)
			end
		})
		t.HumanoidDiedConnection = RoactModule.createElement(EventConnectionModule, {
			event = p1.state.humanoid.Died,
			callback = function() --[[ Line: 67 ]]
				-- upvalues: p1 (copy)
				p1.props.setIsDead(true)
			end
		})
	elseif p1.state.character then
		t.ChildAddedConnection = RoactModule.createElement(EventConnectionModule, {
			event = p1.state.character.ChildAdded,
			callback = function(Humanoid: Humanoid) --[[ Line: 74 ]]
				-- upvalues: p1 (copy)
				if Humanoid:IsA("Humanoid") then
					p1:setState({ humanoid = Humanoid })
				end
			end
		})
	end
	t.CharacterAddedConnection = RoactModule.createElement(EventConnectionModule, {
		event = LocalPlayer.CharacterAdded,
		callback = function(Character) --[[ Line: 86 ]]
			-- upvalues: p1 (copy), RoactModule (upval)
			p1:setState({
				humanoid = Character:FindFirstChildOfClass("Humanoid") or RoactModule.None,
				character = Character
			})
			p1.props.setIsDead(false)
		end
	})
	t.CharacterRemovingConnection = RoactModule.createElement(EventConnectionModule, {
		event = LocalPlayer.CharacterRemoving,
		callback = function() --[[ Line: 97 ]]
			-- upvalues: p1 (copy), RoactModule (upval)
			p1:setState({
				humanoid = RoactModule.None,
				character = RoactModule.None
			})
		end
	})
	
	return RoactModule.createFragment(t)
end

function HealthConnector.didUpdate(p1, _, p2) --[[ Line: 108 ]]
	if p1.state.humanoid == nil then
		p1.props.updateHealth(0, 0)
	elseif p1.state.humanoid ~= p2.humanoid then
		p1.props.setIsDead(false)
		p1.props.updateHealth(p1.state.humanoid.Health, p1.state.humanoid.MaxHealth)
	end
	if p1.state.character and p1.state.character ~= p2.character then
		local Humanoid = p1.state.character:FindFirstChildWhichIsA("Humanoid")
		
		if Humanoid and Humanoid ~= p1.state.humanoid then
			p1:setState({ humanoid = Humanoid })
		end
	end
end

local function mapDispatchToProps(Callback) --[[ Line: 126 ]]
	-- upvalues: SetIsDeadModule (copy), UpdateHealthModule (copy)
	return {
		setIsDead = function(p1) --[[ Line: 128 ]]
			-- upvalues: Callback (copy), SetIsDeadModule (upval)
			return Callback(SetIsDeadModule(p1))
		end,
		updateHealth = function(p1, p2) --[[ Line: 132 ]]
			-- upvalues: Callback (copy), UpdateHealthModule (upval)
			return Callback(UpdateHealthModule(p1, p2))
		end
	}
end

return if FFlagTopBarSignalizeHealthBar then nil else RoactRoduxModule.UNSTABLE_connect2(nil, mapDispatchToProps)(HealthConnector)