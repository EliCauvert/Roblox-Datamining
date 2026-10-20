local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local TutilsModule = require(CorePackages.Packages.tutils)
local SetBoundInputsModule = require(Modules.LuaApp.Actions.SetBoundInputs)
local MaybeClearBoundInputsModule = require(Modules.LuaApp.Actions.MaybeClearBoundInputs)
local BoundInputsUpdater = RoactModule.PureComponent:extend("BoundInputsUpdater")
BoundInputsUpdater.validateProps = TModule.strictInterface({
	focusController = TModule.table,
	setBoundInputs = TModule.callback,
	maybeClearBoundInputs = TModule.callback
})

function BoundInputsUpdater.disconnectEvent(p1)
	if p1.disconnect ~= nil then
		p1.disconnect()
		p1.disconnect = nil
	end
end

function BoundInputsUpdater.subscribeEvent(p1)
	-- upvalues: TutilsModule (copy)
	p1.disconnect = p1.props.focusController.subscribeToBoundInputsChanged(function(LastBoundInputs)
		-- upvalues: TutilsModule (upval), p1 (copy)
		if next(LastBoundInputs) ~= nil then
			if not TutilsModule.deepEqual(LastBoundInputs, p1.lastBoundInputs) then
				p1.props.setBoundInputs(LastBoundInputs, p1.props.focusController)
			end
			p1.lastBoundInputs = LastBoundInputs
		end
	end)
	local BoundInputs = p1.props.focusController.getBoundInputs()
	
	if next(BoundInputs) ~= nil then
		p1.props.setBoundInputs(BoundInputs, p1.props.focusController)
	end
end

function BoundInputsUpdater.didMount(p1)
	p1:subscribeEvent()
end

function BoundInputsUpdater:render()
	return nil
end

function BoundInputsUpdater.didUpdate(p1, p2)
	if p1.props.focusController ~= p2.focusController then
		p1:disconnectEvent()
		p1:subscribeEvent()
	end
end

function BoundInputsUpdater.willUnmount(p1)
	p1:disconnectEvent()
	p1.props.maybeClearBoundInputs(p1.props.focusController)
end

local v1 = RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: SetBoundInputsModule (copy), MaybeClearBoundInputsModule (copy)
	return {
		setBoundInputs = function(p1, p2)
			-- upvalues: Callback (copy), SetBoundInputsModule (upval)
			Callback(SetBoundInputsModule(p1, p2))
		end,
		maybeClearBoundInputs = function(p1)
			-- upvalues: Callback (copy), MaybeClearBoundInputsModule (upval)
			Callback(MaybeClearBoundInputsModule(p1))
		end
	}
end)(BoundInputsUpdater)

return function(p1)
	-- upvalues: RoactGamepadModule (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactGamepadModule.withFocusController(function(FocusController)
		-- upvalues: RoactModule (upval), v1 (upval), CryoModule (upval), p1 (copy)
		return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { focusController = FocusController }))
	end)
end