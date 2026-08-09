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
local fFlagChromeActivatedMappedSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local MUSIC_WINDOW_MAX_SIZE = constantsModule.MUSIC_WINDOW_MAX_SIZE
local useSignalState = signalsReactModule.useSignalState
local var14 = windowSizeSignalModule.new(MUSIC_WINDOW_MAX_SIZE.X, MUSIC_WINDOW_MAX_SIZE.Y)
local var15 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function() --[[ line: 31 ]]
	-- upvalues: serviceModule (ref)
	return serviceModule:isWindowOpen("music_entrypoint")
end)
local var16, var17 = signalsModule.createSignal(false)

local function focusMusicWindow() --[[ line: 37 ]]
	-- upvalues: guiService (ref), var17 (ref)
	guiService:SetMenuIsOpen(true, "music_entrypoint")
	var17(true)
end

local function unfocusMusicWindow() --[[ line: 42 ]]
	-- upvalues: var17 (ref), guiService (ref)
	var17(false)
	guiService:SetMenuIsOpen(false, "music_entrypoint")
end

return serviceModule:register({
	id = "music_entrypoint",
	draggable = true,
	cachePosition = true,
	label = "CoreScripts.TopBar.Music",
	initialAvailability = serviceModule.AvailabilitySignal.Available,
	sideSheetPlacement = sideSheetPlacement.Vertical,
	windowSize = var14,
	activated = function() --[[ line: 55 ]]
		-- upvalues: responsiveModule (ref), chromeModule (ref), focusMusicWindow (ref), var15 (ref), serviceModule (ref)
		if responsiveModule.GetInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
			chromeModule.FocusUtils.FocusOffChrome(focusMusicWindow)
			
			if var15:get() then
				return
			else
				serviceModule:toggleWindow("music_entrypoint")
				
				return
			end
		else
			serviceModule:toggleWindow("music_entrypoint")
		end
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then var15 else function() --[[ line: 73 ]]
		-- upvalues: var15 (ref)
		return var15:get()
	end,
	components = {
		Icon = function(_) --[[ line: 77 ]]
			-- upvalues: commonIconModule (ref), var15 (ref)
			return commonIconModule("icons/common/music", "icons/common/musicFilled_medium", var15)
		end,
		Window = function() --[[ line: 80 ]]
			-- upvalues: useSignalState (ref), var16 (ref), reactModule (ref), foundationModule (ref), var14 (ref), songbirdModule (ref), var17 (ref), guiService (ref), serviceModule (ref), unfocusMusicWindow (ref)
			return reactModule.createElement(foundationModule.View, {
				tag = "auto-xy",
				onAbsoluteSizeChanged = function(value) --[[ line: 85 ]]
					-- upvalues: var14 (copy)
					var14:requestSize(value.AbsoluteSize.X, value.AbsoluteSize.Y)
				end
			}, {
				ChromeWindowWrapper = reactModule.createElement(songbirdModule.ChromeWindowWrapper, {
					isFocused = useSignalState(var16),
					onClose = function() --[[ line: 91 ]]
						-- upvalues: var17 (copy), guiService (copy), serviceModule (copy)
						var17(false)
						guiService:SetMenuIsOpen(false, "music_entrypoint")
						serviceModule:toggleWindow("music_entrypoint")
					end,
					onUnfocus = unfocusMusicWindow
				})
			})
		end
	}
})