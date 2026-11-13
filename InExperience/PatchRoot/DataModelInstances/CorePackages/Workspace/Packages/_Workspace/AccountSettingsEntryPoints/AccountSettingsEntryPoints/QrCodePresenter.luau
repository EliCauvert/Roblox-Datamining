local CoreGui = game:GetService("CoreGui")
local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local FoundationModule = require(Parent1.Foundation)
local _ = require(Parent.AccountSettingsPage)
local AccountSettingsQrDialogModule = require(Parent.AccountSettingsQrDialog)
local v1 = nil

return {
	show = function(Page, OnClosed)
		-- upvalues: v1 (ref), CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), FoundationModule (copy), AccountSettingsQrDialogModule (copy)
		local v2 = v1
		
		if v2 then
			v1 = nil
			v2.root:unmount()
			v2.container:Destroy()
			
			if v2.onClosed then
				v2.onClosed()
			end
		end
		local AccountSettingsQrCode = Instance.new("Folder")
		AccountSettingsQrCode.Name = "AccountSettingsQrCode"
		AccountSettingsQrCode.Parent = CoreGui
		local Root = ReactRobloxModule.createRoot(AccountSettingsQrCode)
		local config = {
			root = Root,
			container = AccountSettingsQrCode,
			onClosed = OnClosed
		}
		v1 = config
		Root:render(ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			QrDialog = ReactModule.createElement(AccountSettingsQrDialogModule, {
				page = Page,
				onClose = function()
					-- upvalues: v1 (upval), config (copy)
					task.defer(function()
						-- upvalues: v1 (upval), config (upval)
						if v1 == config then
							local v3 = v1
							
							if not v3 then return end
							v1 = nil
							v3.root:unmount()
							v3.container:Destroy()
							
							if v3.onClosed then
								v3.onClosed()
							end
						end
					end)
				end
			})
		}))
	end,
	hide = function()
		-- upvalues: v1 (ref)
		local v2 = v1
		
		if not v2 then return end
		v1 = nil
		v2.root:unmount()
		v2.container:Destroy()
		
		if v2.onClosed then
			v2.onClosed()
		end
	end
}