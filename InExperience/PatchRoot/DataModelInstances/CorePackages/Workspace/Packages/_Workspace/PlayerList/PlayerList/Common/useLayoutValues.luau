local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local DisplayModule = require(Parent1.Display)
local CryoModule = require(Parent1.Cryo)
local FoundationModule = require(Parent1.Foundation)
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local LayoutValuesContextModule = require(script.Parent.LayoutValuesContext)
local FFlagEnableMobilePlayerListOnConsoleModule = require(Parent.Flags.FFlagEnableMobilePlayerListOnConsole)
local FFlagPlayerListDropDownShowPlatformNameModule = require(Parent.Flags.FFlagPlayerListDropDownShowPlatformName)

return function() --[[ Line: 21 | Named "useLayoutValues" ]]
	-- upvalues: ReactModule (copy), LayoutValuesContextModule (copy), UseTokensFunction (copy), FFlagEnableMobilePlayerListOnConsoleModule (copy), UseScaledValueFunction (copy), SignalsReactModule (copy), DisplayModule (copy), FFlagPlayerListDropDownShowPlatformNameModule (copy), CryoModule (copy)
	local UseContextResult = ReactModule.useContext(LayoutValuesContextModule)
	local UseTokensResult = UseTokensFunction()
	local UseScaledValueResultRatio = if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueFunction(UseContextResult.PlayerDropDownSizeX * 10) / 10 else nil
	local UseScaledValueResultRatio1 = if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueFunction((UseContextResult.EntryBaseSizeX or 150) * 10) / 10 else nil
	local UseScaledValueResultRatio2 = if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueFunction(UseContextResult.PlayerDropDownSizeXMobile * 10) / 10 else nil
	local UseScaledValueResultRatio3 = if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueFunction(UseContextResult.PlayerNameSizeXMobile * 10) / 10 else nil
	local UseSignalStateResult = if FFlagEnableMobilePlayerListOnConsoleModule then nil else SignalsReactModule.useSignalState(DisplayModule.GetDisplayStore)
	local UseSignalStateResult1 = if FFlagEnableMobilePlayerListOnConsoleModule then nil else SignalsReactModule.useSignalState(UseSignalStateResult.getUIScale)
	local Size100 = UseTokensResult.Size.Size_100
	
	return CryoModule.Dictionary.join(UseContextResult, {
		PlayerListSizeMin = if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueFunction(500) else nil,
		PlayerListSizeMax = if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueFunction(600) else nil,
		ContainerPadding = Size100,
		ContainerPosition = UDim2.new(1, -Size100, 0, Size100),
		ExtraContainerPadding = UseTokensResult.Size.Size_400,
		PlayerDropDownSizeX = if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueResultRatio else UseContextResult.PlayerDropDownSizeX * UseSignalStateResult1,
		PlayerDropDownOffset = UseTokensResult.Size.Size_100,
		EntryBaseSizeX = if UseContextResult.EntryBaseSizeX then if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueResultRatio1 else UseContextResult.EntryBaseSizeX * UseSignalStateResult1 else nil,
		EntrySizeIncreasePerStat = UseTokensResult.Size.Size_300,
		PlayerEntrySizeY = UseTokensResult.Size.Size_1000,
		TeamEntrySizeY = UseTokensResult.Size.Size_600,
		TeamNameTextSize = if FFlagEnableMobilePlayerListOnConsoleModule then UseTokensResult.FontSize.FontSize_300 else nil,
		StatEntrySizeX = UseTokensResult.Size.Size_1600,
		TitleBarTextSize = if FFlagEnableMobilePlayerListOnConsoleModule then UseTokensResult.FontSize.FontSize_250 else nil,
		TitleBarSizeY = UseTokensResult.Size.Size_500,
		PlayerIconSize = UDim2.new(0, UseTokensResult.Size.Size_400, 0, UseTokensResult.Size.Size_400),
		InitalPlayerEntryPadding = UseTokensResult.Size.Size_300,
		PlayerEntryPadding = UseTokensResult.Size.Size_300,
		PlayerEntryNamePadding = UseTokensResult.Size.Size_100,
		StatTextPadding = UseTokensResult.Size.Size_100,
		PlayerNameSize = UDim2.new(1, -UseTokensResult.Size.Size_900, 1, 0),
		PlayerNameTextSize = UseTokensResult.FontSize.FontSize_300,
		StatTextSize = UseTokensResult.FontSize.FontSize_300,
		ScrollBarOffset = UseTokensResult.Size.Size_100,
		ScrollBarSize = UseTokensResult.Size.Size_200,
		PlayerDropDownSizeXMobile = if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueResultRatio2 else UseContextResult.PlayerDropDownSizeXMobile * UseSignalStateResult1,
		ScrollBarSizeMobile = UseTokensResult.Size.Size_50,
		PlayerNameSizeXMobile = if FFlagEnableMobilePlayerListOnConsoleModule then UseScaledValueResultRatio3 else UseContextResult.PlayerNameSizeXMobile * UseSignalStateResult1,
		PlayerIconSizeMobile = UDim2.fromOffset(UseTokensResult.Size.Size_500, UseTokensResult.Size.Size_500),
		PlayerNameTextSizeMobile = UseTokensResult.FontSize.FontSize_350,
		StatTextSizeMobile = UseTokensResult.FontSize.FontSize_350,
		PlayerNamePaddingXMobile = UseTokensResult.Size.Size_350,
		TeamEntryTextPadding = UseTokensResult.Size.Size_400,
		TeamEntryTextPaddingMobile = UseTokensResult.Size.Size_350,
		PlayerIconBackgroundSize = UDim2.new(0, 66, 0, 66),
		DropDownButtonSizeY = UseTokensResult.Size.Size_1400,
		DropDownButtonTextSize = if FFlagEnableMobilePlayerListOnConsoleModule then UseTokensResult.FontSize.FontSize_400 else nil,
		DropDownPadding = UseTokensResult.Size.Size_250,
		DropDownRightOptionSize = UseTokensResult.Size.Size_1400,
		DropDownIconSize = UseTokensResult.Size.Size_900,
		DropDownHeaderSizeY = UseTokensResult.Size.Size_2000,
		DropDownHeaderBackgroundSize = if FFlagPlayerListDropDownShowPlatformNameModule then UseTokensResult.Size.Size_1800 else UseTokensResult.Size.Size_1600,
		DropDownHeaderDisplayNameTextSize = if FFlagEnableMobilePlayerListOnConsoleModule then UseTokensResult.FontSize.FontSize_400 else nil,
		DropDownHeaderPlayerNameTextSize = if FFlagEnableMobilePlayerListOnConsoleModule then UseTokensResult.FontSize.FontSize_300 else nil,
		DropDownScreenSidePadding = Size100,
		PlayerScrollListSizeTwoTabsOnLegacy = UDim2.new(1, 0, 1, -UseTokensResult.Size.Size_1100)
	})
end