local parent = script.Parent.Parent
local reactRobloxModule = require(parent.ReactRoblox)
local reactModule = require(parent.React)
local notificationModalBaseModule = require(script.Parent.Components.NotificationModalBase)
local var1 = nil
local t = {}

local function _(p1)
	-- upvalues: t (write), var1 (write), reactModule (ref), notificationModalBaseModule (ref)
	if t and t.ModalKey ~= p1.ModalKey and (t.Params and t.Params.CloseCallback) then
		t.Params.CloseCallback()
	end
	t = p1
	var1:render(reactModule.createElement(notificationModalBaseModule, p1))
end

return {
	OpenModal = function(p1, p2, p3)
		-- upvalues: var1 (write), reactRobloxModule (ref), t (write), reactModule (ref), notificationModalBaseModule (ref)
		if not var1 then
			local notificationModals = Instance.new("Folder")
			notificationModals.Name = "NotificationModals"
			notificationModals.Parent = game:GetService("CoreGui")
			var1 = reactRobloxModule.createRoot(notificationModals)
		end
		local t_1 = {
			ModalKey = p1,
			Component = p2,
			Params = p3,
			CloseModal = function()
				-- upvalues: p1 (ref), var1 (copy), t (copy), reactModule (copy), notificationModalBaseModule (copy)
				if var1 and p1 == t.ModalKey then
					local t_1 = {}
					
					if t and t.ModalKey ~= t_1.ModalKey and (t.Params and t.Params.CloseCallback) then
						t.Params.CloseCallback()
					end
					t = t_1
					var1:render(reactModule.createElement(notificationModalBaseModule, t_1))
				end
			end
		}
		
		if t and t.ModalKey ~= t_1.ModalKey and (t.Params and t.Params.CloseCallback) then
			t.Params.CloseCallback()
		end
		t = t_1
		var1:render(reactModule.createElement(notificationModalBaseModule, t_1))
		
		return true
	end,
	CloseModal = function(p1)
		-- upvalues: var1 (write), t (write), reactModule (ref), notificationModalBaseModule (ref)
		if var1 and p1 == t.ModalKey then
			local t_1 = {}
			
			if t and t.ModalKey ~= t_1.ModalKey and (t.Params and t.Params.CloseCallback) then
				t.Params.CloseCallback()
			end
			t = t_1
			var1:render(reactModule.createElement(notificationModalBaseModule, t_1))
		end
	end
}