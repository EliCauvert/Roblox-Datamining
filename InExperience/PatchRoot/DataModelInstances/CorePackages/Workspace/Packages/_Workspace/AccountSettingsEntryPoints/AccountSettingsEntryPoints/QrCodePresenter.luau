local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local FoundationModule = require(Parent1.Foundation)
local FFlagAccountSettingsQrDialogFocusNavigation = require(Parent1.SharedFlags).FFlagAccountSettingsQrDialogFocusNavigation
local _ = require(Parent.AccountSettingsPage)
local v1 = nil
local v2 = nil

local function hide()
	-- upvalues: v1 (ref), FFlagAccountSettingsQrDialogFocusNavigation (copy), GuiService (copy)
	local v3 = v1
	
	if not v3 then return end
	v1 = nil
	
	if v3.host then
		v3.host(nil)
	end
	if v3.root then
		v3.root:unmount()
	end
	if v3.teardownFocusNavigation then
		v3.teardownFocusNavigation()
	end
	if v3.container then
		v3.container:Destroy()
	end
	if FFlagAccountSettingsQrDialogFocusNavigation and v3.root then
		local PreviousSelection = v3.previousSelection
		
		if PreviousSelection and PreviousSelection:IsDescendantOf(game) and GuiService.SelectedCoreObject == nil then
			GuiService.SelectedCoreObject = PreviousSelection
		end
	end
	if v3.onClosed then
		v3.onClosed()
	end
end

return {
	show = function(Page, OnClosed)
		-- upvalues: v1 (ref), hide (copy), GuiService (copy), FFlagAccountSettingsQrDialogFocusNavigation (copy), v2 (ref), Parent (copy), CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), FoundationModule (copy), Parent1 (copy)
		local v3 = v1
		hide()
		local config = {
			onClosed = OnClosed,
			previousSelection = if v3 and v3.host then v3.previousSelection else GuiService.SelectedCoreObject
		}
		v1 = config
		
		local function requestClose()
			-- upvalues: v1 (upval), config (copy), hide (upval)
			task.defer(function()
				-- upvalues: v1 (upval), config (upval), hide (upval)
				if v1 == config then
					hide()
				end
			end)
		end
		
		if FFlagAccountSettingsQrDialogFocusNavigation and v2 then
			local Callback: (any) -> () = v2
			config.host = Callback
			Callback({
				page = Page,
				onClose = requestClose,
				previousSelection = config.previousSelection
			})
			
			return
		end
		local AccountSettingsQrCode = Instance.new("Folder")
		AccountSettingsQrCode.Name = "AccountSettingsQrCode"
		AccountSettingsQrCode.Parent = CoreGui
		config.container = AccountSettingsQrCode
		local Root = ReactRobloxModule.createRoot(AccountSettingsQrCode)
		config.root = Root
		local Element = ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			QrDialog = ReactModule.createElement(require(Parent.AccountSettingsQrDialog), { page = Page, onClose = requestClose })
		})
		
		if FFlagAccountSettingsQrDialogFocusNavigation then
			local ReactFocusNavigationModule = require(Parent1.ReactFocusNavigation)
			local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
			local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
			
			function config.teardownFocusNavigation()
				-- upvalues: NewResult (copy)
				NewResult:teardown()
			end
			
			Root:render(ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
				FocusRegistry = ReactModule.createElement(FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider, nil, { Foundation = Element })
			}))
			
			return
		else
			Root:render(Element)
		end
	end,
	hide = hide,
	attachHost = function(Host)
		-- upvalues: v2 (ref), v1 (ref)
		v2 = Host
		
		return function()
			-- upvalues: v2 (upval), Host (copy), v1 (upval)
			if v2 == Host then
				v2 = nil
			end
			local v3 = v1
			
			if v3 and v3.host == Host then
				v1 = nil
				
				if v3.onClosed then
					v3.onClosed()
				end
			end
		end
	end,
	restoreSelection = function(SelectedCoreObject)
		-- upvalues: GuiService (copy)
		if SelectedCoreObject and SelectedCoreObject:IsDescendantOf(game) and GuiService.SelectedCoreObject == nil then
			GuiService.SelectedCoreObject = SelectedCoreObject
		end
	end
}