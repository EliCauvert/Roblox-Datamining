local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local sideSheetPlacement = chromeModule.Enums.SideSheetPlacement
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local songbirdModule = require(corePackagesService.Workspace.Packages.Songbird)
local serviceModule = require(chrome.Service)
local constantsModule = require(chrome.Integrations.MusicUtility.Constants)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local windowSizeSignalModule = require(chrome.ChromeShared.Service.WindowSizeSignal)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local MUSIC_WINDOW_MAX_SIZE = constantsModule.MUSIC_WINDOW_MAX_SIZE
local useSignalState = signalsReactModule.useSignalState
local var1 = windowSizeSignalModule.new(MUSIC_WINDOW_MAX_SIZE.X, MUSIC_WINDOW_MAX_SIZE.Y)
local var2 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function()
	-- upvalues: serviceModule (ref)
	return serviceModule:isWindowOpen("music_entrypoint")
end)
local var3, var4 = signalsModule.createSignal(false)

local function focusMusicWindow()
	-- upvalues: guiService (ref), var4 (ref)
	guiService:SetMenuIsOpen(true, "music_entrypoint")
	var4(true)
end

local function unfocusMusicWindow()
	-- upvalues: var4 (ref), guiService (ref)
	var4(false)
	guiService:SetMenuIsOpen(false, "music_entrypoint")
end

return serviceModule:register({
	id = "music_entrypoint",
	draggable = true,
	cachePosition = true,
	label = "CoreScripts.TopBar.Music",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Page,
	windowSize = var1,
	activated = function()
		-- upvalues: responsiveModule (ref), chromeModule (ref), focusMusicWindow (ref), var2 (ref), serviceModule (ref)
		if responsiveModule.GetInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
			chromeModule.FocusUtils.FocusOffChrome(focusMusicWindow)
			
			if var2:get() then
				return
			else
				serviceModule:toggleWindow("music_entrypoint")
				
				return
			end
		else
			serviceModule:toggleWindow("music_entrypoint")
		end
	end,
	isActivated = var2,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), var2 (ref)
			return commonIconModule("icons/common/music", "icons/common/musicFilled_medium", var2)
		end,
		Window = function()
			-- upvalues: useSignalState (ref), var3 (ref), reactModule (ref), foundationModule (ref), var1 (ref), songbirdModule (ref), var4 (ref), guiService (ref), serviceModule (ref), unfocusMusicWindow (ref)
			return reactModule.createElement(foundationModule.View, {
				tag = "auto-xy",
				onAbsoluteSizeChanged = function(value)
					-- upvalues: var1 (copy)
					var1:requestSize(value.AbsoluteSize.X, value.AbsoluteSize.Y)
				end
			}, {
				ChromeWindowWrapper = reactModule.createElement(songbirdModule.ChromeWindowWrapper, {
					isFocused = useSignalState(var3),
					onClose = function()
						-- upvalues: var4 (copy), guiService (copy), serviceModule (copy)
						var4(false)
						guiService:SetMenuIsOpen(false, "music_entrypoint")
						serviceModule:toggleWindow("music_entrypoint")
					end,
					onUnfocus = unfocusMusicWindow
				})
			})
		end
	}
})