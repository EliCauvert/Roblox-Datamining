local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local SongbirdModule = require(CorePackages.Workspace.Packages.Songbird)
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local MUSICWINDOWMAXSIZE = require(Chrome.Integrations.MusicUtility.Constants).MUSIC_WINDOW_MAX_SIZE
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local NewResult = require(Chrome.ChromeShared.Service.WindowSizeSignal).new(MUSICWINDOWMAXSIZE.X, MUSICWINDOWMAXSIZE.Y)
local NewResult1 = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function() --[[ Line: 28 ]]
	-- upvalues: ServiceModule (copy)
	return ServiceModule:isWindowOpen("music_entrypoint")
end)
local Signal, Signal2 = require(CorePackages.Packages.Signals).createSignal(false)

local function focusMusicWindow() --[[ Line: 34 ]]
	-- upvalues: GuiService (copy), Signal2 (copy)
	GuiService:SetMenuIsOpen(true, "music_entrypoint")
	Signal2(true)
end

local function unfocusMusicWindow() --[[ Line: 39 ]]
	-- upvalues: Signal2 (copy), GuiService (copy)
	Signal2(false)
	GuiService:SetMenuIsOpen(false, "music_entrypoint")
end

return ServiceModule:register({
	id = "music_entrypoint",
	draggable = true,
	cachePosition = true,
	label = "CoreScripts.TopBar.Music",
	initialAvailability = ServiceModule.AvailabilitySignal.Available,
	sideSheetPlacement = SideSheetPlacement.BelowFold,
	windowSize = NewResult,
	activated = function() --[[ Line: 52 ]]
		-- upvalues: ResponsiveModule (copy), ChromeModule (copy), focusMusicWindow (copy), NewResult1 (copy), ServiceModule (copy)
		if ResponsiveModule.GetInputModeStore(false).getLastInputType(false) == ResponsiveModule.Input.Directional then
			ChromeModule.FocusUtils.FocusOffChrome(focusMusicWindow)
			
			if not NewResult1:get() then
				ServiceModule:toggleWindow("music_entrypoint")
				
				return
			end
		else
			ServiceModule:toggleWindow("music_entrypoint")
		end
	end,
	isActivated = NewResult1,
	components = {
		Icon = function(_) --[[ Line: 70 ]]
			-- upvalues: CommonIconModule (copy), NewResult1 (copy)
			return CommonIconModule("icons/common/music", "icons/common/musicFilled_medium", NewResult1)
		end,
		Window = function() --[[ Line: 73 ]]
			-- upvalues: UseSignalStateFunction (copy), Signal (copy), ReactModule (copy), FoundationModule (copy), NewResult (copy), SongbirdModule (copy), Signal2 (copy), GuiService (copy), ServiceModule (copy), unfocusMusicWindow (copy)
			return ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy",
				onAbsoluteSizeChanged = function(Frame: Frame) --[[ Line: 78 ]]
					-- upvalues: NewResult (upval)
					NewResult:requestSize(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y)
				end
			}, {
				ChromeWindowWrapper = ReactModule.createElement(SongbirdModule.ChromeWindowWrapper, {
					isFocused = UseSignalStateFunction(Signal),
					onClose = function() --[[ Line: 84 ]]
						-- upvalues: Signal2 (upval), GuiService (upval), ServiceModule (upval)
						Signal2(false)
						GuiService:SetMenuIsOpen(false, "music_entrypoint")
						ServiceModule:toggleWindow("music_entrypoint")
					end,
					onUnfocus = unfocusMusicWindow
				})
			})
		end
	}
})