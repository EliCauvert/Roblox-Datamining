local Parent = script.Parent.Parent
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactModule = require(Parent.React)
local NotificationModalBaseModule = require(script.Parent.Components.NotificationModalBase)
local Root = nil
local t = {}

local function _(p1)
	-- upvalues: t (ref), Root (ref), ReactModule (copy), NotificationModalBaseModule (copy)
	if t and t.ModalKey ~= p1.ModalKey and t.Params and t.Params.CloseCallback then
		t.Params.CloseCallback()
	end
	t = p1
	Root:render(ReactModule.createElement(NotificationModalBaseModule, p1))
end

return {
	OpenModal = function(ModalKey, Component, Params): boolean
		-- upvalues: Root (ref), ReactRobloxModule (copy), t (ref), ReactModule (copy), NotificationModalBaseModule (copy)
		if not Root then
			local NotificationModals = Instance.new("Folder")
			NotificationModals.Name = "NotificationModals"
			NotificationModals.Parent = game:GetService("CoreGui")
			Root = ReactRobloxModule.createRoot(NotificationModals)
		end
		local config = {
			ModalKey = ModalKey,
			Component = Component,
			Params = Params,
			CloseModal = function()
				-- upvalues: ModalKey (copy), Root (upval), t (upval), ReactModule (upval), NotificationModalBaseModule (upval)
				if Root and ModalKey == t.ModalKey then
					local t1 = {}
					
					if t and t.ModalKey ~= t1.ModalKey and t.Params and t.Params.CloseCallback then
						t.Params.CloseCallback()
					end
					t = t1
					Root:render(ReactModule.createElement(NotificationModalBaseModule, t1))
				end
			end
		}
		
		if t and t.ModalKey ~= config.ModalKey and t.Params and t.Params.CloseCallback then
			t.Params.CloseCallback()
		end
		t = config
		Root:render(ReactModule.createElement(NotificationModalBaseModule, config))
		
		return true
	end,
	CloseModal = function(ModalKey)
		-- upvalues: Root (ref), t (ref), ReactModule (copy), NotificationModalBaseModule (copy)
		if Root and ModalKey == t.ModalKey then
			local t1 = {}
			
			if t and t.ModalKey ~= t1.ModalKey and t.Params and t.Params.CloseCallback then
				t.Params.CloseCallback()
			end
			t = t1
			Root:render(ReactModule.createElement(NotificationModalBaseModule, t1))
		end
	end
}