local CoreGui = game:GetService("CoreGui")
local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local FoundationModule = require(Parent1.Foundation)
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent1.ReactFocusNavigation)
local LeaveRobloxDialogModule = require(Parent.LeaveRobloxDialog)
local Provider = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local v1 = nil

local function _(p1): boolean
	-- upvalues: v1 (ref)
	if v1 == p1 then
		v1 = nil
		p1.dispose()
		
		return true
	else
		return false
	end
end

return {
	show = function(p1, Callback)
		-- upvalues: v1 (ref), CoreGui (copy), ReactRobloxModule (copy), ReactFocusNavigationModule (copy), ReactModule (copy), FoundationModule (copy), Provider (copy), LeaveRobloxDialogModule (copy)
		local v2 = v1
		
		if v2 then
			local Flag = nil
			if v1 == v2 then
				v1 = nil
				v2.dispose()
				Flag = true
			else
				Flag = false
			end
			if Flag then
				v2.onCancel()
			end
		end
		local AccountSettingsLeaveRoblox = Instance.new("Folder")
		AccountSettingsLeaveRoblox.Name = "AccountSettingsLeaveRoblox"
		AccountSettingsLeaveRoblox.Parent = CoreGui
		local Root = ReactRobloxModule.createRoot(AccountSettingsLeaveRoblox)
		local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
		local config = {
			dispose = function()
				-- upvalues: Root (copy), NewResult (copy), AccountSettingsLeaveRoblox (copy)
				Root:unmount()
				NewResult:teardown()
				AccountSettingsLeaveRoblox:Destroy()
			end,
			onCancel = Callback
		}
		v1 = config
		
		local function _(p2)
			-- upvalues: config (copy), v1 (upval)
			task.defer(function()
				-- upvalues: config (upval), v1 (upval), p2 (copy)
				local Flag = nil
				if v1 == config then
					v1 = nil
					config.dispose()
					Flag = true
				else
					Flag = false
				end
				if Flag then
					p2()
				end
			end)
		end
		
		Root:render(ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
				FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, {
					LeaveRobloxDialog = ReactModule.createElement(LeaveRobloxDialogModule, {
						onContinue = function()
							-- upvalues: p1 (copy), config (copy), v1 (upval)
							task.defer(function()
								-- upvalues: config (upval), v1 (upval), p1 (copy)
								local Flag = nil
								if v1 == config then
									v1 = nil
									config.dispose()
									Flag = true
								else
									Flag = false
								end
								if Flag then
									p1()
								end
							end)
						end,
						onCancel = function()
							-- upvalues: Callback (copy), config (copy), v1 (upval)
							task.defer(function()
								-- upvalues: config (upval), v1 (upval), Callback (copy)
								local Flag = nil
								if v1 == config then
									v1 = nil
									config.dispose()
									Flag = true
								else
									Flag = false
								end
								if Flag then
									Callback()
								end
							end)
						end
					})
				})
			})
		}))
	end,
	hide = function()
		-- upvalues: v1 (ref)
		local v2 = v1
		
		if v2 then
			local Flag = nil
			if v1 == v2 then
				v1 = nil
				v2.dispose()
				Flag = true
			else
				Flag = false
			end
			if Flag then
				v2.onCancel()
			end
		end
	end
}