local parent = script.Parent.Parent
local reactRobloxModule = require(parent.ReactRoblox)
local reactModule = require(parent.React)
local notificationModalBaseModule = require(script.Parent.Components.NotificationModalBase)
local var3 = nil
local t = {}

local function _(p0) --[[ line: 13 | named "UpdateRoot" ]]
	-- upvalues: t (write), var3 (write), reactModule (ref), notificationModalBaseModule (ref)
	if t and t.ModalKey ~= p0.ModalKey and (t.Params and t.Params.CloseCallback) then
		t.Params.CloseCallback()
	end
	t = p0
	var3:render(reactModule.createElement(notificationModalBaseModule, p0))
end

return {
	OpenModal = function(p1, p2, p3) --[[ line: 28 ]]
		-- upvalues: var3 (write), reactRobloxModule (ref), t (write), reactModule (ref), notificationModalBaseModule (ref)
		if not var3 then
			local notificationModals = Instance.new("Folder")
			notificationModals.Name = "NotificationModals"
			notificationModals.Parent = game:GetService("CoreGui")
			var3 = reactRobloxModule.createRoot(notificationModals)
		end
		local t_1 = {
			ModalKey = p1,
			Component = p2,
			Params = p3,
			CloseModal = function() --[[ line: 40 ]]
				-- upvalues: p1 (ref), var3 (copy), t (copy), reactModule (copy), notificationModalBaseModule (copy)
				if var3 and p1 == t.ModalKey then
					local t_1 = {}
					
					if t and t.ModalKey ~= t_1.ModalKey and (t.Params and t.Params.CloseCallback) then
						t.Params.CloseCallback()
					end
					t = t_1
					var3:render(reactModule.createElement(notificationModalBaseModule, t_1))
				end
			end
		}
		
		if t and t.ModalKey ~= t_1.ModalKey and (t.Params and t.Params.CloseCallback) then
			t.Params.CloseCallback()
		end
		t = t_1
		var3:render(reactModule.createElement(notificationModalBaseModule, t_1))
		
		return true
	end,
	CloseModal = function(p4) --[[ line: 22 ]]
		-- upvalues: var3 (write), t (write), reactModule (ref), notificationModalBaseModule (ref)
		if var3 and p4 == t.ModalKey then
			local t_1 = {}
			
			if t and t.ModalKey ~= t_1.ModalKey and (t.Params and t.Params.CloseCallback) then
				t.Params.CloseCallback()
			end
			t = t_1
			var3:render(reactModule.createElement(notificationModalBaseModule, t_1))
		end
	end
}