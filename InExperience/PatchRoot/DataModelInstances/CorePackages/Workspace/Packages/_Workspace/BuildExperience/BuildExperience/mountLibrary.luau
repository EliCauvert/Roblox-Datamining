local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local LocalizationService = game:GetService("LocalizationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local LinkingProtocolModule = require(Parent.LinkingProtocol)
local DeepLinkSource = LinkingProtocolModule.Enums.DeepLinkSource
local Default = LinkingProtocolModule.LinkingProtocol.default
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local SignalsModule = require(Parent.Signals)
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local LibraryThemeProviderModule = require(BuildExperience.Components.Library.LibraryThemeProvider)
local LibraryLeavingOverlayModule = require(BuildExperience.Components.Library.LibraryLeavingOverlay)
local _ = require(BuildExperience.Components.Library.LibraryDetail.LibraryDetailContainer)
local LibraryExperienceViewModule = require(BuildExperience.Components.Library.LibraryExperienceView)
local LibraryNavigatorModule = require(BuildExperience.Components.Library.LibraryNavigator)
local UseLibraryWorldCutoutViewModelModule = require(BuildExperience.Components.Library.LibraryWorldCutout.useLibraryWorldCutoutViewModel)
local GetAndroidBackSignalModule = require(BuildExperience.utils.getAndroidBackSignal)
local BindLibraryBackInputModule = require(BuildExperience.utils.bindLibraryBackInput)
local LeaveExperienceModule = require(BuildExperience.utils.leaveExperience)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local _ = require(BuildExperience.Components.Library.LibraryCategories)
local CreateBuildLibraryStoreModule = require(BuildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local UseLibraryStringsModule = require(BuildExperience.Components.Library.useLibraryStrings)
local GetLibraryStoreModule = require(BuildExperience.Stores.GetLibraryStore)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local CreateViewerWorldPickerModule = require(BuildExperience.createViewerWorldPicker)
local GetDefaultWorldFocusModule = require(BuildExperience.Components.Library.LibraryWorldCutout.getDefaultWorldFocus)
local GetModelBoxModule = require(BuildExperience.Components.Library.LibraryWorldCutout.getModelBox)
local FIntBuildExperienceLibrarySelectAllMaxModule = require(BuildExperience.Flags.FIntBuildExperienceLibrarySelectAllMax)
local GetLibraryMatchesModule = require(BuildExperience.Components.Library.getLibraryMatches)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local LibraryTypesModule = require(BuildExperience.Components.Library.LibraryTypes)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local Tbl = {}
local v1 = nil

local function _(Model: Model, p1)
	local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
	p1.requestFocus(BoundingCFrame.Position, BoundingSize.Magnitude / 2, Model)
end

local function outlineModel(Path, Model)
	-- upvalues: Tbl (copy), CoreGui (copy)
	local Entry = Tbl[Path]
	
	if Entry ~= nil then
		Entry:Destroy()
	end
	local BuildLibraryFocusHighlight = Instance.new("Highlight")
	BuildLibraryFocusHighlight.Name = "BuildLibraryFocusHighlight"
	BuildLibraryFocusHighlight.DepthMode = Enum.HighlightDepthMode.Occluded
	BuildLibraryFocusHighlight.OutlineColor = Color3.fromRGB(0, 200, 255)
	BuildLibraryFocusHighlight.FillColor = Color3.fromRGB(0, 170, 255)
	BuildLibraryFocusHighlight.FillTransparency = 0.75
	BuildLibraryFocusHighlight.Adornee = Model
	BuildLibraryFocusHighlight.Parent = CoreGui
	Tbl[Path] = BuildLibraryFocusHighlight
end

local _ = function(Key)
	-- upvalues: Tbl (copy)
	local Entry = Tbl[Key]
	
	if Entry ~= nil then
		Entry:Destroy()
		Tbl[Key] = nil
	end
end

local _ = function()
	-- upvalues: Tbl (copy)
	for _, value in Tbl do
		value:Destroy()
	end
	table.clear(Tbl)
end

local function requestModelsFocus(List, p1)
	-- upvalues: GetModelBoxModule (copy)
	local MinResult = nil
	local MaxResult = nil
	
	for _, value in List do
		local ModelBoxModule = GetModelBoxModule(value)
		
		if ModelBoxModule ~= nil then
			if MinResult == nil then
				MinResult = ModelBoxModule.minimum
			else
				MinResult = MinResult:Min(ModelBoxModule.minimum)
			end
			if MaxResult == nil then
				MaxResult = ModelBoxModule.maximum
			else
				MaxResult = MaxResult:Max(ModelBoxModule.maximum)
			end
		end
	end
	if MinResult ~= nil and MaxResult ~= nil then
		p1.requestFocus((MinResult + MaxResult) / 2, (MaxResult - MinResult).Magnitude / 2)
	end
end

local _ = function(p2, p3, p4)
	-- upvalues: GetDefaultWorldFocusModule (copy)
	local DefaultWorldFocusModule = GetDefaultWorldFocusModule(p2, p4)
	
	if DefaultWorldFocusModule ~= nil then
		p3.requestFocus(DefaultWorldFocusModule.position, DefaultWorldFocusModule.radius)
	end
end

local function limitSelectAll(UseMemoResult, p2)
	-- upvalues: FIntBuildExperienceLibrarySelectAllMaxModule (copy)
	local Largest = math.max(1, FIntBuildExperienceLibrarySelectAllMaxModule)
	
	if #UseMemoResult <= Largest then
		return UseMemoResult, p2.selectAll
	else
		return table.move(UseMemoResult, 1, Largest, 1, {}), (string.gsub(p2.selectFirst, "{count}", (tostring(Largest))))
	end
end

local _ = function(p2)
	local Success, Result = pcall(function()
		-- upvalues: p2 (copy)
		return p2:GetService("Workspace")
	end)
	
	return if Success and typeof(Result) == "Instance" and Result:IsA("Workspace") then Result else nil
end

local function ConnectedLibrary(p2)
	-- upvalues: GetLibraryStoreModule (copy), ReactModule (copy), Tbl (copy), UseLibraryStringsModule (copy), SignalsReactModule (copy), UseLibraryWorldCutoutViewModelModule (copy), SendBuildExperienceEventModule (copy), RoactNavigationModule (copy), SignalsModule (copy), GetPlayButtonStoreModule (copy), FFlagBuildExperienceLibrary (copy), GetDefaultWorldFocusModule (copy), RunService (copy), LibraryTypesModule (copy), outlineModel (copy), requestModelsFocus (copy), CreateViewerWorldPickerModule (copy), HttpService (copy), Default (copy), DeepLinkSource (copy), LeaveExperienceModule (copy), GetAndroidBackSignalModule (copy), BindLibraryBackInputModule (copy), GetLibraryMatchesModule (copy), limitSelectAll (copy), LibraryNavigatorModule (copy), FocusNavigationUtilsModule (copy), LibraryExperienceViewModule (copy), LibraryLeavingOverlayModule (copy), FoundationModule (copy)
	local LibraryStoreModule = GetLibraryStoreModule()
	local UseRefResult = ReactModule.useRef(os.clock())
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p2 (copy)
		return {
			universeId = p2.dataModel.GameId,
			placeId = p2.dataModel.PlaceId
		}
	end, { p2.dataModel })
	local UseRefResult2 = ReactModule.useRef({})
	
	local function getSelectionPaths(Path)
		-- upvalues: UseRefResult2 (copy)
		local List = {}
		
		for _, value in UseRefResult2.current do
			if value.path ~= Path then
				table.insert(List, value.path)
			end
		end
		return List
	end
	
	local function deselect(Path)
		-- upvalues: UseRefResult2 (copy), Tbl (upval)
		local Current = {}
		
		for _, value in UseRefResult2.current do
			if value.path ~= Path then
				table.insert(Current, value)
			end
		end
		UseRefResult2.current = Current
		local Entry = Tbl[Path]
		
		if Entry ~= nil then
			Entry:Destroy()
			Tbl[Path] = nil
		end
	end
	
	local UseLibraryStringsModuleResult = UseLibraryStringsModule()
	local UseIsOpenResult = LibraryStoreModule.useIsOpen()
	local UseSignalStateResult = SignalsReactModule.useSignalState(LibraryStoreModule.getChatComposerState)
	local OnAddResource = if UseSignalStateResult == nil then nil else UseSignalStateResult.onAddResource
	local OnRemoveResourceByPath = if UseSignalStateResult == nil then nil else UseSignalStateResult.onRemoveResourceByPath
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: OnAddResource (copy), OnRemoveResourceByPath (copy), getSelectionPaths (copy), deselect (copy), LibraryStoreModule (copy)
		return if OnAddResource == nil or OnRemoveResourceByPath == nil then {
			onAddResource = function(p3): boolean
				-- upvalues: LibraryStoreModule (upval)
				LibraryStoreModule.requestAddToChat(p3)
				
				return true
			end,
			onRemoveResource = LibraryStoreModule.requestRemoveFromChat
		} else {
			onAddResource = function(p3)
				-- upvalues: getSelectionPaths (upval), deselect (upval), OnRemoveResourceByPath (upval), OnAddResource (upval)
				for _, value in getSelectionPaths(p3.path) do
					deselect(value)
					OnRemoveResourceByPath(value)
				end
				return OnAddResource(p3)
			end,
			onRemoveResource = function(ChatResource)
				-- upvalues: OnRemoveResourceByPath (upval)
				OnRemoveResourceByPath(ChatResource.path)
			end
		}
	end, {
		OnAddResource or false,
		OnRemoveResourceByPath or false,
		LibraryStoreModule
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState({ routeName = "Browser" })
	local ItemId = if UseStateResult.routeName == "Detail" then UseStateResult.params.itemId else nil
	local Model = if ItemId == nil then "Model" else UseStateResult.params.itemKind
	local Params = if UseStateResult.routeName == "Category" or UseStateResult.routeName == "Search" and UseStateResult.params.itemKind ~= nil then UseStateResult.params else nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p2 (copy)
		local DataModel = p2.dataModel
		local Success, Result = pcall(function()
			-- upvalues: DataModel (copy)
			return DataModel:GetService("Workspace")
		end)
		
		return if Success and typeof(Result) == "Instance" and Result:IsA("Workspace") then Result else nil
	end, { p2.dataModel })
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(p2.library.getItems)
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult1 (copy), p2 (copy), UseSignalStateResult1 (copy)
		local List = {}
		
		if UseMemoResult1 == nil then
			return List
		end
		local Players = p2.dataModel:GetService("Players")
		
		for _, value in UseSignalStateResult1 do
			local Model = value.model
			
			if Model ~= nil and Model:IsDescendantOf(UseMemoResult1) and Players:GetPlayerFromCharacter(Model) == nil then
				table.insert(List, Model)
			end
		end
		return List
	end, { UseMemoResult1, UseSignalStateResult1, p2.dataModel })
	local IsAvailable = #UseMemoResult2 > 0
	local UseLibraryWorldCutoutViewModelModuleResult = UseLibraryWorldCutoutViewModelModule({
		isAvailable = IsAvailable,
		isHome = UseStateResult.routeName == "Browser",
		isOpen = UseIsOpenResult,
		onViewportRectChanged = LibraryStoreModule.setWorldViewportRect
	})
	ReactModule.useEffect(function()
		-- upvalues: ItemId (copy), p2 (copy), SendBuildExperienceEventModule (upval), UseResult (copy), UseIsOpenResult (copy), UseStateResult (copy), Model (copy), Params (copy)
		local Item = if ItemId == nil then nil else p2.library.getItem(false, ItemId)
		SendBuildExperienceEventModule("LIBRARY_IMPRESSION", UseResult(), {
			phase = "viewed",
			surface = if UseIsOpenResult then UseStateResult.routeName else "World",
			kind = if ItemId == nil then if Params == nil then "All" else Params.itemKind else Model,
			scope = if Params == nil or Params.folderId == nil then "Root" else "Folder",
			hasDescription = if Item == nil then nil else tostring(Item.description ~= nil),
			location = if Item == nil then nil else Item.rootName
		})
	end, {
		p2.library, UseResult, UseIsOpenResult, UseStateResult.routeName,
		ItemId or false, Model, Params ~= nil and (Params.folderId or Params.itemKind)
	})
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult3 (copy)
		UseRefResult3.current = Current
		
		return function()
			-- upvalues: UseRefResult3 (upval)
			UseRefResult3.current = nil
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(_, p3)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p3.routes[p3.index])
	end, {})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2_1 (copy), UseRefResult3 (copy), UseStateResult (copy), RoactNavigationModule (upval), Params (copy), UseRefResult4 (copy), SendBuildExperienceEventModule (upval), UseResult (copy)
		UseStateResult2_1(p3)
		local CurrentFunction: (any) -> () = UseRefResult3.current
		
		if CurrentFunction ~= nil then
			local ReducedMotion = UserSettings():GetService("UserGameSettings").ReducedMotion
			
			if p3 == "" or UseStateResult.routeName == "Search" then
				if p3 == "" and UseStateResult.routeName == "Search" then
					CurrentFunction(RoactNavigationModule.StackActions.pop({ immediate = ReducedMotion }))
				end
			else
				CurrentFunction(RoactNavigationModule.Actions.navigate({
					routeName = "Search",
					key = "LibrarySearch",
					params = Params or {},
					immediate = ReducedMotion
				}))
			end
		end
		if UseRefResult4.current ~= nil then
			task.cancel(UseRefResult4.current)
		end
		UseRefResult4.current = task.delay(0.3, function()
			-- upvalues: UseRefResult4 (upval), SendBuildExperienceEventModule (upval), UseResult (upval), Params (upval), p3 (copy)
			UseRefResult4.current = nil
			SendBuildExperienceEventModule("LIBRARY_SEARCH", UseResult(), {
				surface = if Params == nil then "Browser" else "Category",
				kind = if Params == nil then "All" else Params.itemKind,
				scope = if Params == nil or Params.folderId == nil then "Root" else "Folder",
				hasQuery = tostring(p3 ~= "")
			})
		end)
	end, { UseResult, UseStateResult, Params or false })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy)
		return function()
			-- upvalues: UseRefResult4 (upval)
			if UseRefResult4.current ~= nil then
				task.cancel(UseRefResult4.current)
				UseRefResult4.current = nil
			end
		end
	end, {
		ItemId or false,
		Params ~= nil and Params.itemKind,
		Params ~= nil and (Params.folderId or false)
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseResult3 (copy)
		UseResult3("")
	end, { UseResult3 })
	local Library = p2.library
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: Library (copy), SendBuildExperienceEventModule (upval), UseResult (copy), UseRefResult1 (copy)
		local Success, Result = pcall(function()
			-- upvalues: Library (upval)
			Library.refresh()
			
			return nil
		end)
		
		if not Success then
			SendBuildExperienceEventModule("LIBRARY_FETCH_FAILED", UseResult(), {
				surface = "Library",
				reason = "refresh_failed",
				phase = if UseRefResult1.current then "refresh" else "initial"
			})
			error(Result, 0)
		end
	end, { Library, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: SendBuildExperienceEventModule (upval), UseResult (copy), p2 (copy), UseResult5 (copy), UseStateResult2_2 (copy), UseRefResult1 (copy), Library (copy), UseRefResult (copy)
		SendBuildExperienceEventModule("LIBRARY_IMPRESSION", UseResult(), { phase = "opened", surface = "Library" })
		local DataModel = p2.dataModel
		
		local function ready()
			-- upvalues: UseResult5 (upval), UseStateResult2_2 (upval), UseRefResult1 (upval), Library (upval), SendBuildExperienceEventModule (upval), UseResult (upval), UseRefResult (upval)
			UseResult5()
			UseStateResult2_2(true)
			
			if not UseRefResult1.current then
				UseRefResult1.current = true
				local config = { Model = 0, Image = 0, Sound = 0, Folder = 0 }
				
				for _, value in Library.getItems(false) do
					local Folder = if value.className == "Folder" then "Folder" else value.kind
					config[Folder] += 1
				end
				SendBuildExperienceEventModule("LIBRARY_IMPRESSION", UseResult(), {
					phase = "ready",
					surface = "Library",
					durationMs = tostring((math.round((os.clock() - UseRefResult.current) * 1000))),
					modelCount = tostring(config.Model),
					imageCount = tostring(config.Image),
					soundCount = tostring(config.Sound),
					folderEntryCount = tostring(config.Folder)
				})
			end
		end
		
		local LoadedConnection = DataModel.Loaded:Connect(ready)
		local PersistentLoadedConnection = DataModel:GetService("Workspace").PersistentLoaded:Connect(ready)
		
		if DataModel:IsLoaded() then
			ready()
		end
		return function()
			-- upvalues: LoadedConnection (copy), PersistentLoadedConnection (copy)
			LoadedConnection:Disconnect()
			PersistentLoadedConnection:Disconnect()
		end
	end, { Library, p2.dataModel, UseResult5, UseResult })
	local UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), ItemId (copy), Library (copy)
		return SignalsModule.createComputed(function(p3)
			-- upvalues: ItemId (upval), Library (upval)
			return if ItemId == nil then nil else Library.getItem(p3, ItemId)
		end)
	end, { Library, ItemId or false })))
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy), UseStateResult (copy), UseStateResult2_1 (copy), UseResult5 (copy), LibraryStoreModule (copy), GetPlayButtonStoreModule (upval), RoactNavigationModule (upval)
		local CurrentFunction: (any) -> () = UseRefResult3.current
		
		if UseStateResult.routeName == "Browser" or CurrentFunction == nil then
			LibraryStoreModule.setIsOpen(false)
			
			return
		end
		if UseStateResult.routeName == "Search" then
			UseStateResult2_1("")
		else
			UseResult5()
		end
		LibraryStoreModule.setIsOpen(true)
		GetPlayButtonStoreModule().setIsActive(false)
		CurrentFunction(RoactNavigationModule.StackActions.pop({
			immediate = UseStateResult.routeName == "Search" and UserSettings():GetService("UserGameSettings").ReducedMotion
		}))
	end, { UseStateResult.routeName, LibraryStoreModule, UseResult5 })
	local UseResult7 = ReactModule.useCallback(function(ItemKind, CategoryKey, Title, FolderId)
		-- upvalues: UseResult5 (copy), UseStateResult2_1 (copy), UseRefResult3 (copy), SendBuildExperienceEventModule (upval), UseResult (copy), UseStateResult (copy), RoactNavigationModule (upval)
		UseResult5()
		
		if FolderId ~= nil then
			UseStateResult2_1("")
		end
		local CurrentFunction: (any) -> () = UseRefResult3.current
		
		if CurrentFunction ~= nil then
			SendBuildExperienceEventModule("LIBRARY_CATEGORY_CLICK", UseResult(), {
				action = if FolderId == nil then "category" else "folder",
				kind = ItemKind,
				surface = UseStateResult.routeName
			})
			CurrentFunction(RoactNavigationModule.Actions.navigate({
				routeName = "Category",
				key = if FolderId == nil then "LibraryCategory" else `LibraryFolder:{FolderId}`,
				params = {
					itemKind = ItemKind,
					categoryKey = CategoryKey,
					title = Title,
					folderId = FolderId
				}
			}))
		end
	end, { UseResult5, UseResult, UseStateResult.routeName })
	local UseResult8 = ReactModule.useCallback(function(ItemId, ItemKind)
		-- upvalues: UseRefResult3 (copy), Library (copy), SendBuildExperienceEventModule (upval), UseResult (copy), LibraryStoreModule (copy), UseStateResult (copy), RoactNavigationModule (upval)
		local CurrentFunction: (any) -> () = UseRefResult3.current
		
		if CurrentFunction ~= nil then
			local Item = Library.getItem(false, ItemId)
			SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), {
				action = "detail",
				kind = ItemKind,
				surface = if LibraryStoreModule.getIsOpen(false) then UseStateResult.routeName else "World",
				location = if Item == nil then nil else Item.rootName
			})
			CurrentFunction(RoactNavigationModule.Actions.navigate({
				routeName = "Detail",
				key = "LibraryDetail",
				params = { itemId = ItemId, itemKind = ItemKind }
			}))
		end
	end, {
		UseResult,
		UseStateResult.routeName,
		LibraryStoreModule,
		Library
	})
	local UseRefResult5 = ReactModule.useRef(false)
	local UseRefResult6 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult5 (copy), UseMemoResult1 (copy), UseIsOpenResult (copy), UseLibraryWorldCutoutViewModelModuleResult (copy), UseStateResult3 (copy), FFlagBuildExperienceLibrary (upval), IsAvailable (copy), UseMemoResult2 (copy), LibraryStoreModule (copy), GetDefaultWorldFocusModule (upval), UseSignalStateResult1 (copy), UseRefResult6 (copy)
		if UseRefResult5.current or UseMemoResult1 == nil then return end
		if not UseIsOpenResult or UseLibraryWorldCutoutViewModelModuleResult.phase ~= "Home" then
			UseRefResult5.current = true
			
			return
		end
		if not UseStateResult3 or not UseLibraryWorldCutoutViewModelModuleResult.isMeasured then return end
		if not FFlagBuildExperienceLibrary then
			local Model = nil
			for _, value in UseSignalStateResult1 do
				Model = value.model
				
				if value.folderId == nil and value.className ~= "Folder" and Model ~= nil and Model:IsDescendantOf(UseMemoResult1) then
					UseRefResult5.current = true
					UseRefResult6.current = Model
					local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
					LibraryStoreModule.requestFocus(BoundingCFrame.Position, BoundingSize.Magnitude / 2, Model)
					break
				end
			end
			return
		elseif IsAvailable then
			UseRefResult5.current = true
			local DefaultWorldFocusModule = GetDefaultWorldFocusModule(UseMemoResult2, UseMemoResult1)
			
			if DefaultWorldFocusModule ~= nil then
				LibraryStoreModule.requestFocus(DefaultWorldFocusModule.position, DefaultWorldFocusModule.radius)
			end
		end
	end, {
		UseSignalStateResult1, UseStateResult3, UseIsOpenResult,
		UseLibraryWorldCutoutViewModelModuleResult.phase,
		UseLibraryWorldCutoutViewModelModuleResult.isMeasured, UseMemoResult1,
		LibraryStoreModule, IsAvailable, UseMemoResult2
	})
	local IsBrowser: boolean = UseIsOpenResult and UseStateResult.routeName == "Browser"
	local UseRefResult7 = ReactModule.useRef(IsBrowser)
	ReactModule.useEffect(function()
		-- upvalues: FFlagBuildExperienceLibrary (upval), IsBrowser (copy), UseRefResult7 (copy), UseRefResult5 (copy), IsAvailable (copy), UseMemoResult2 (copy), LibraryStoreModule (copy), UseMemoResult1 (copy), GetDefaultWorldFocusModule (upval), UseRefResult6 (copy)
		if FFlagBuildExperienceLibrary then
			if IsBrowser and not UseRefResult7.current and UseRefResult5.current and IsAvailable then
				local DefaultWorldFocusModule = GetDefaultWorldFocusModule(UseMemoResult2, UseMemoResult1)
				
				if DefaultWorldFocusModule ~= nil then
					LibraryStoreModule.requestFocus(DefaultWorldFocusModule.position, DefaultWorldFocusModule.radius)
				end
			end
			UseRefResult7.current = IsBrowser
			
			return
		else
			local Current = UseRefResult6.current
			local FocusRequest = LibraryStoreModule.getFocusRequest(false)
			
			if IsBrowser and not UseRefResult7.current and Current ~= nil and UseMemoResult1 ~= nil and Current:IsDescendantOf(UseMemoResult1) and (FocusRequest == nil or FocusRequest.model ~= Current) then
				local BoundingCFrame, BoundingSize = Current:GetBoundingBox()
				LibraryStoreModule.requestFocus(BoundingCFrame.Position, BoundingSize.Magnitude / 2, Current)
			end
			UseRefResult7.current = IsBrowser
		end
	end, {
		IsBrowser,
		UseMemoResult1,
		LibraryStoreModule,
		IsAvailable,
		UseMemoResult2
	})
	local Browser = ReactModule.useRef("Browser")
	Browser.current = if UseIsOpenResult then UseStateResult.routeName else "World"
	local UseRefResult8 = ReactModule.useRef(false)
	local UseResult9 = ReactModule.useCallback(function(Reason)
		-- upvalues: UseRefResult8 (copy), SendBuildExperienceEventModule (upval), UseResult (copy), Browser (copy)
		if not UseRefResult8.current then
			UseRefResult8.current = true
			SendBuildExperienceEventModule("LIBRARY_IMPRESSION", UseResult(), {
				phase = "closed",
				reason = Reason,
				surface = Browser.current
			})
			
			return
		end
	end, { UseResult })
	local UseRefResult9 = ReactModule.useRef(UseResult9)
	UseRefResult9.current = UseResult9
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult9 (copy)
		return function()
			-- upvalues: UseRefResult9 (upval)
			UseRefResult9.current("other")
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), Tbl (upval)
		game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
		
		return function()
			-- upvalues: p2 (upval), Tbl (upval)
			p2.onUnmount()
			
			for _, value in Tbl do
				value:Destroy()
			end
			table.clear(Tbl)
		end
	end, { p2.onUnmount })
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseRefResult10 = ReactModule.useRef(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval), UseStateResult2_4 (copy)
		local RenderSteppedConnection = RunService.RenderStepped:Once(function()
			-- upvalues: UseStateResult2_4 (upval)
			UseStateResult2_4(true)
		end)
		
		return function()
			-- upvalues: RenderSteppedConnection (copy)
			RenderSteppedConnection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: IsBrowser (copy), Tbl (upval)
		if IsBrowser then
			for _, value in Tbl do
				value:Destroy()
			end
			table.clear(Tbl)
		end
	end, { IsBrowser })
	local UseRefResult11 = ReactModule.useRef(0)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult2 (copy), UseRefResult11 (copy), LibraryStoreModule (copy), LibraryTypesModule (upval), deselect (copy), UseMemoResult (copy), UseResult5 (copy)
		if UseSignalStateResult2 == nil or UseSignalStateResult2.model == nil then return end
		local Flag = true
		local DestroyingConnection = UseSignalStateResult2.model.Destroying:Connect(function()
			-- upvalues: UseRefResult11 (upval), LibraryStoreModule (upval), LibraryTypesModule (upval), UseSignalStateResult2 (upval), deselect (upval), UseMemoResult (upval), Flag (ref), UseResult5 (upval)
			UseRefResult11.current += 1
			LibraryStoreModule.clearFocus()
			local ChatResource = LibraryTypesModule.toChatResource(UseSignalStateResult2)
			deselect(ChatResource.path)
			UseMemoResult.onRemoveResource(ChatResource)
			task.defer(function()
				-- upvalues: Flag (upval), UseResult5 (upval)
				if Flag then
					UseResult5()
				end
			end)
		end)
		
		return function()
			-- upvalues: Flag (ref), DestroyingConnection (copy)
			Flag = false
			DestroyingConnection:Disconnect()
		end
	end, {
		UseSignalStateResult2 or false,
		LibraryStoreModule,
		UseMemoResult,
		UseResult5
	})
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(GetPlayButtonStoreModule().getIsActive)
	local IsIsAssistantResponding: boolean = UseSignalStateResult ~= nil and UseSignalStateResult.isAssistantResponding == true
	local UseRefResult12 = ReactModule.useRef(false)
	local UseRefResult13 = ReactModule.useRef(nil)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(LibraryStoreModule.getPromptFailure)
	local UseRefResult14 = ReactModule.useRef(if UseSignalStateResult4 == nil then 0 else UseSignalStateResult4.token)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult4 (copy), UseRefResult14 (copy), UseRefResult13 (copy), SendBuildExperienceEventModule (upval), UseResult (copy)
		if UseSignalStateResult4 == nil or UseSignalStateResult4.token <= UseRefResult14.current then return end
		UseRefResult14.current = UseSignalStateResult4.token
		local Current = UseRefResult13.current
		
		if Current == nil then return end
		UseRefResult13.current = nil
		local Copy = table.clone(Current)
		Copy.phase = "failed"
		
		if UseSignalStateResult4.errorCode ~= nil then
			Copy.errorCode = tostring(UseSignalStateResult4.errorCode)
		end
		SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), Copy)
	end, { UseSignalStateResult4, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult12 (copy), IsIsAssistantResponding (copy), UseRefResult13 (copy), UseStateResult3 (copy), UseIsOpenResult (copy), UseResult5 (copy)
		if UseRefResult12.current and not IsIsAssistantResponding then
			UseRefResult13.current = nil
		end
		if UseRefResult12.current and not IsIsAssistantResponding and UseStateResult3 and UseIsOpenResult then
			UseResult5()
		end
		UseRefResult12.current = IsIsAssistantResponding
	end, {
		IsIsAssistantResponding,
		UseStateResult3,
		UseIsOpenResult,
		UseResult5
	})
	local UseRefResult15 = ReactModule.useRef(OnRemoveResourceByPath)
	UseRefResult15.current = OnRemoveResourceByPath
	
	local function _(List)
		-- upvalues: UseRefResult15 (copy), LibraryStoreModule (copy)
		local CurrentFunction: (any) -> () = UseRefResult15.current
		
		if CurrentFunction == nil then
			LibraryStoreModule.requestRemoveAllFromChat(List)
			
			return
		end
		for _, value in List do
			CurrentFunction(value.path)
		end
	end
	
	local UseRefResult16 = ReactModule.useRef({})
	
	local function unwatchSelection()
		-- upvalues: UseRefResult16 (copy)
		for _, Connection in UseRefResult16.current do
			Connection:Disconnect()
		end
		UseRefResult16.current = {}
	end
	
	local function watchSelection(List)
		-- upvalues: UseRefResult16 (copy), LibraryTypesModule (upval), UseRefResult15 (copy), LibraryStoreModule (copy), UseResult5 (copy), deselect (copy)
		for _, Connection in UseRefResult16.current do
			Connection:Disconnect()
		end
		UseRefResult16.current = {}
		local ChatResources = {}
		
		for _, value in List do
			local Model = value.model
			
			if Model ~= nil then
				local ChatResource = LibraryTypesModule.toChatResource(value)
				table.insert(UseRefResult16.current, Model.Destroying:Connect(function()
					-- upvalues: ChatResources (ref), UseRefResult15 (upval), LibraryStoreModule (upval), UseResult5 (upval), ChatResource (copy), deselect (upval)
					if #ChatResources == 0 then
						task.defer(function()
							-- upvalues: ChatResources (upval), UseRefResult15 (upval), LibraryStoreModule (upval), UseResult5 (upval)
							local ChatResources1 = ChatResources
							ChatResources = {}
							local CurrentFunction: (any) -> () = UseRefResult15.current
							
							if CurrentFunction == nil then
								LibraryStoreModule.requestRemoveAllFromChat(ChatResources1)
							else
								for _, value in ChatResources1 do
									CurrentFunction(value.path)
								end
							end
							UseResult5()
						end)
					end
					table.insert(ChatResources, ChatResource)
					deselect(ChatResource.path)
				end))
			end
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: unwatchSelection (copy)
		return unwatchSelection
	end, {})
	local UseResult10 = ReactModule.useCallback(function(List, p3)
		-- upvalues: Tbl (upval), outlineModel (upval), LibraryTypesModule (upval), LibraryStoreModule (copy), requestModelsFocus (upval), UseRefResult11 (copy), getSelectionPaths (copy), UseRefResult2 (copy), FFlagBuildExperienceLibrary (upval), watchSelection (copy), GetPlayButtonStoreModule (upval)
		for _, value in Tbl do
			value:Destroy()
		end
		table.clear(Tbl)
		local List1 = {}
		
		for _, value1 in List do
			if value1.model ~= nil then
				outlineModel(LibraryTypesModule.toChatResource(value1).path, value1.model)
				table.insert(List1, value1.model)
			end
		end
		if #List == 1 and #List1 == 1 then
			local Entry = List1[1]
			local BoundingCFrame, BoundingSize = Entry:GetBoundingBox()
			LibraryStoreModule.requestFocus(BoundingCFrame.Position, BoundingSize.Magnitude / 2, Entry)
		elseif #List1 > 0 then
			requestModelsFocus(List1, LibraryStoreModule)
		end
		LibraryStoreModule.setIsOpen(false)
		UseRefResult11.current += 1
		local Current = UseRefResult11.current
		task.defer(function()
			-- upvalues: UseRefResult11 (upval), Current (copy), LibraryStoreModule (upval), List (copy), LibraryTypesModule (upval), getSelectionPaths (upval), p3 (copy), UseRefResult2 (upval), FFlagBuildExperienceLibrary (upval), watchSelection (upval), GetPlayButtonStoreModule (upval)
			if UseRefResult11.current ~= Current or LibraryStoreModule.getIsOpen(false) then return end
			local Current1 = {}
			
			for _, value in List do
				table.insert(Current1, LibraryTypesModule.toChatResource(value))
			end
			LibraryStoreModule.requestAddAllToChat(Current1, getSelectionPaths(), p3)
			UseRefResult2.current = Current1
			
			if FFlagBuildExperienceLibrary then
				watchSelection(List)
			end
			GetPlayButtonStoreModule().setIsActive(true)
		end)
	end, { LibraryStoreModule })
	local UseResult11 = ReactModule.useCallback(function(p4, p5)
		-- upvalues: UseResult10 (copy)
		if p4.model == nil or p4.model:IsDescendantOf(workspace) then
			UseResult10({ p4 }, p5)
			
			return
		end
	end, { UseResult10 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult11 (copy)
		return function()
			-- upvalues: UseRefResult11 (upval)
			UseRefResult11.current += 1
		end
	end, {})
	local UseSignalStateResult5 = SignalsReactModule.useSignalState(LibraryStoreModule.getChipEvent)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult5 (copy), UseRefResult2 (copy), LibraryTypesModule (upval), deselect (copy), Library (copy), outlineModel (upval), LibraryStoreModule (copy)
		if UseSignalStateResult5 == nil then return end
		local List = {}
		
		for _, value in UseRefResult2.current do
			if table.find(UseSignalStateResult5.uris, LibraryTypesModule.toResourceUri(value.path)) then
				table.insert(List, value)
			end
		end
		if #List == 0 then return end
		if UseSignalStateResult5.kind == "Removed" then
			for _, value1 in List do
				deselect(value1.path)
			end
			return
		else
			if UseSignalStateResult5.kind ~= "Activated" then
				LibraryStoreModule.requestAddAllToChat(List, {}, false)
				
				return
			end
			local t = {}
			
			for _, value2 in UseRefResult2.current do
				t[value2.path] = true
			end
			for _, value3 in Library.getItems(false) do
				if t[value3.path] and value3.model ~= nil and value3.model:IsDescendantOf(workspace) then
					outlineModel(value3.path, value3.model)
					
					if value3.path == List[1].path then
						local Model = value3.model
						local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
						LibraryStoreModule.requestFocus(BoundingCFrame.Position, BoundingSize.Magnitude / 2, Model)
					end
				end
			end
		end
	end, {
		UseSignalStateResult5,
		LibraryStoreModule,
		Library.getItems
	})
	ReactModule.useEffect(function()
		-- upvalues: UseIsOpenResult (copy), UseStateResult3 (copy), IsAvailable (copy), p2 (copy), CreateViewerWorldPickerModule (upval), LibraryStoreModule (copy), Library (copy), UseResult5 (copy), UseResult8 (copy), UseResult11 (copy), GetPlayButtonStoreModule (upval), UseRefResult2 (copy), UseRefResult16 (copy), Tbl (upval), UseRefResult15 (copy)
		if UseIsOpenResult or not UseStateResult3 or not IsAvailable then
			return nil
		end
		local Workspace = p2.dataModel:GetService("Workspace")
		local CurrentCamera = Workspace.CurrentCamera
		
		if CurrentCamera == nil then
			return nil
		else
			local Flag = true
			local ViewerWorldPickerModule = CreateViewerWorldPickerModule({
				camera = CurrentCamera,
				userInputService = p2.dataModel:GetService("UserInputService"),
				world = Workspace,
				isBlocked = function()
					-- upvalues: Flag (ref), LibraryStoreModule (upval)
					return not Flag or LibraryStoreModule.getIsOpen(false)
				end,
				onPick = function(p4)
					-- upvalues: Library (upval), UseResult5 (upval), UseResult8 (upval), UseResult11 (upval), GetPlayButtonStoreModule (upval)
					local ResolveWorldItemResult = Library.resolveWorldItem(p4)
					
					if ResolveWorldItemResult == nil then
						UseResult5()
						ResolveWorldItemResult = Library.resolveWorldItem(p4)
					end
					if ResolveWorldItemResult ~= nil then
						UseResult8(ResolveWorldItemResult.id, ResolveWorldItemResult.kind)
						UseResult11(ResolveWorldItemResult, not GetPlayButtonStoreModule().getIsActive(false))
					end
				end,
				onMiss = function()
					-- upvalues: UseRefResult2 (upval), UseRefResult16 (upval), Tbl (upval), UseRefResult15 (upval), LibraryStoreModule (upval)
					local Current = UseRefResult2.current
					
					if #Current == 0 then return end
					UseRefResult2.current = {}
					
					for _, Connection in UseRefResult16.current do
						Connection:Disconnect()
					end
					UseRefResult16.current = {}
					
					for _, value in Tbl do
						value:Destroy()
					end
					table.clear(Tbl)
					local CurrentFunction: (any) -> () = UseRefResult15.current
					
					if CurrentFunction == nil then
						LibraryStoreModule.requestRemoveAllFromChat(Current)
						
						return
					end
					for _, value1 in Current do
						CurrentFunction(value1.path)
					end
				end
			})
			
			return function()
				-- upvalues: Flag (ref), ViewerWorldPickerModule (copy)
				Flag = false
				ViewerWorldPickerModule()
			end
		end
	end, {
		UseIsOpenResult, UseStateResult3, IsAvailable, LibraryStoreModule, Library,
		UseResult5, UseResult11, UseResult8, UseMemoResult, p2.dataModel
	})
	
	local function OnShowLibrary()
		-- upvalues: UseStateResult3 (copy), UseResult5 (copy), LibraryStoreModule (copy), SendBuildExperienceEventModule (upval), UseResult (copy), UseLibraryWorldCutoutViewModelModuleResult (copy), FFlagBuildExperienceLibrary (upval), ItemId (copy), Model (copy), UseRefResult11 (copy), GetPlayButtonStoreModule (upval)
		if UseStateResult3 then
			UseResult5()
		end
		if not LibraryStoreModule.getIsOpen(false) then
			SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), if UseLibraryWorldCutoutViewModelModuleResult.exit() then {
				action = "back",
				kind = "All",
				surface = "World",
				source = "home_cutout"
			} elseif FFlagBuildExperienceLibrary and ItemId == nil then {
				action = "back",
				kind = "Model",
				surface = "World",
				source = "select_all"
			} else { action = "object", surface = "World", kind = Model })
		end
		UseRefResult11.current += 1
		GetPlayButtonStoreModule().setIsActive(false)
		LibraryStoreModule.setIsOpen(true)
	end
	
	local UseResult12 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: LibraryStoreModule (copy)
		LibraryStoreModule.setWorldViewportRect(if Frame == nil then nil else Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize))
	end, { LibraryStoreModule })
	
	local function OnShowWorld(p4)
		-- upvalues: ItemId (copy), Library (copy), LibraryStoreModule (copy), UseResult11 (copy), SendBuildExperienceEventModule (upval), UseResult (copy)
		if ItemId ~= nil then
			local Item = Library.getItem(false, ItemId)
			
			if Item ~= nil then
				local IsOpen = LibraryStoreModule.getIsOpen(false)
				UseResult11(Item, p4 ~= "prompt")
				local Inverted: boolean = IsOpen and not LibraryStoreModule.getIsOpen(false)
				
				if Inverted or IsOpen and Item.model ~= nil and not Item.model:IsDescendantOf(workspace) then
					SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), {
						action = "world",
						surface = "Detail",
						outcome = if Inverted then nil else "unavailable",
						kind = Item.kind,
						source = p4 or "segmented_control",
						location = Item.rootName
					})
				end
				return
			end
		end
		LibraryStoreModule.setIsOpen(false)
	end
	
	local function OnActivated()
		-- upvalues: UseStateResult (copy), LibraryStoreModule (copy), UseLibraryWorldCutoutViewModelModuleResult (copy), SendBuildExperienceEventModule (upval), UseResult (copy), FFlagBuildExperienceLibrary (upval), UseMemoResult2 (copy), UseMemoResult1 (copy), GetDefaultWorldFocusModule (upval), OnShowWorld (copy)
		if UseStateResult.routeName ~= "Browser" or not LibraryStoreModule.getIsOpen(false) or not UseLibraryWorldCutoutViewModelModuleResult.enter() then return end
		SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), {
			action = "world",
			kind = "All",
			surface = "Home",
			source = "home_cutout"
		})
		
		if FFlagBuildExperienceLibrary then
			local DefaultWorldFocusModule = GetDefaultWorldFocusModule(UseMemoResult2, UseMemoResult1)
			
			if DefaultWorldFocusModule ~= nil then
				LibraryStoreModule.requestFocus(DefaultWorldFocusModule.position, DefaultWorldFocusModule.radius)
			end
		end
		OnShowWorld()
	end
	
	local function returnToAppChat(p4, p5)
		-- upvalues: UseRefResult10 (copy), UseStateResult2_3 (copy), UseResult9 (copy), p2 (copy), HttpService (upval), Default (upval), DeepLinkSource (upval), LeaveExperienceModule (upval)
		if UseRefResult10.current then return end
		UseRefResult10.current = true
		UseStateResult2_3(true)
		UseResult9(p5)
		local P40 = p4 or p2.sessionId
		local NavigationName: string = `roblox://navigation/build?universeid={p2.dataModel.GameId}`
		
		if P40 ~= nil then
			NavigationName ..= `&sessionid={HttpService:UrlEncode(P40)}`
		end
		if Default:isInternalDlicEnabled() then
			local InternalDlic = Default:createInternalDlic(NavigationName, DeepLinkSource.LuaInternal)
			task.spawn(LeaveExperienceModule, function()
				-- upvalues: Default (upval), InternalDlic (copy)
				Default:detectDeeplinkIntent(InternalDlic)
			end)
		else
			task.spawn(LeaveExperienceModule, function()
				-- upvalues: Default (upval), NavigationName (ref)
				Default:detectURL(NavigationName)
			end)
		end
	end
	
	local function onNavigateBack()
		-- upvalues: UseRefResult10 (copy), UseIsOpenResult (copy), OnShowLibrary (copy), UseStateResult (copy), returnToAppChat (copy), UseResult6 (copy)
		if UseRefResult10.current then return end
		if not UseIsOpenResult then
			OnShowLibrary()
			
			return
		end
		if UseStateResult.routeName == "Browser" then
			returnToAppChat(nil, "back_button")
			
			return
		else
			UseResult6()
		end
	end
	
	local UseRefResult17 = ReactModule.useRef(onNavigateBack)
	UseRefResult17.current = onNavigateBack
	local UseRefResult18 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult17 (copy), GetAndroidBackSignalModule (upval), BindLibraryBackInputModule (upval), UseRefResult18 (copy)
		local function navigateBack()
			-- upvalues: UseRefResult17 (upval)
			UseRefResult17.current()
		end
		
		local Connection = GetAndroidBackSignalModule():Connect(navigateBack)
		local BindLibraryBackInputModuleResult = BindLibraryBackInputModule(navigateBack)
		UseRefResult18.current = BindLibraryBackInputModuleResult
		
		return function()
			-- upvalues: Connection (copy), BindLibraryBackInputModuleResult (copy), UseRefResult18 (upval)
			Connection:Disconnect()
			BindLibraryBackInputModuleResult.unbind()
			UseRefResult18.current = nil
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult18 (copy), UseSignalStateResult3 (copy)
		if UseRefResult18.current ~= nil then
			UseRefResult18.current.setChatOpen(UseSignalStateResult3)
		end
	end, { UseSignalStateResult3 })
	local Copy = if UseSignalStateResult == nil then nil else table.clone(UseSignalStateResult)
	
	if Copy ~= nil and UseSignalStateResult ~= nil then
		local OnSendFunction = UseSignalStateResult.onSend
		
		function Copy.onSend()
			-- upvalues: Model (copy), UseSignalStateResult2 (copy), SendBuildExperienceEventModule (upval), UseResult (copy), OnSendFunction (copy), returnToAppChat (copy), UseRefResult13 (copy), OnShowWorld (copy)
			local Tbl = {
				action = "prompt",
				surface = "Detail",
				kind = Model,
				location = if UseSignalStateResult2 == nil then nil else UseSignalStateResult2.rootName
			}
			
			local function onPromptAccepted()
				-- upvalues: Tbl (copy), SendBuildExperienceEventModule (upval), UseResult (upval)
				local Copy = table.clone(Tbl)
				Copy.phase = "received"
				SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), Copy)
			end
			
			local OnSendResult = if Model == "Image" or Model == "Sound" then OnSendFunction(function(p4)
				-- upvalues: Tbl (copy), SendBuildExperienceEventModule (upval), UseResult (upval), returnToAppChat (upval)
				local Copy = table.clone(Tbl)
				Copy.phase = "received"
				SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), Copy)
				returnToAppChat(p4, "prompt_return")
			end) else OnSendFunction(onPromptAccepted)
			
			if OnSendResult then
				UseRefResult13.current = Tbl
			end
			if OnSendResult and Model == "Model" then
				OnShowWorld("prompt")
			end
			local Copy = table.clone(Tbl)
			Copy.phase = "submit"
			Copy.outcome = if OnSendResult then "accepted" else "rejected"
			SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), Copy)
			
			return OnSendResult
		end
	end
	local IsCategory: boolean = UseStateResult.routeName == "Category" or UseStateResult.routeName == "Search"
	local Params1 = if IsCategory then UseStateResult.params or {} else {}
	local UseStateResult6 = if UseStateResult.routeName == "Search" then UseStateResult1 else ""
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: FFlagBuildExperienceLibrary (upval), IsCategory (copy), Params1 (copy), UseMemoResult2 (copy), GetLibraryMatchesModule (upval), UseSignalStateResult1 (copy), UseStateResult6 (copy)
		local List = {}
		
		if not FFlagBuildExperienceLibrary or not IsCategory then
			return List
		end
		if Params1.itemKind ~= nil and Params1.itemKind ~= "Model" then
			return List
		end
		local t = {}
		
		for _, value in UseMemoResult2 do
			t[value] = true
		end
		for _, value1 in GetLibraryMatchesModule(UseSignalStateResult1, "Model", UseStateResult6, Params1.folderId, true) do
			if value1.model ~= nil and t[value1.model] then
				table.insert(List, value1)
			end
		end
		return List
	end, {
		IsCategory, Params1.itemKind or false, Params1.folderId or false,
		UseStateResult6, UseSignalStateResult1, UseMemoResult2
	})
	local LimitSelectAllResult, LimitSelectAllResult2 = limitSelectAll(UseMemoResult3, UseLibraryStringsModuleResult)
	
	local function v148()
		-- upvalues: SendBuildExperienceEventModule (upval), UseResult (copy), UseStateResult (copy), Params1 (copy), UseStateResult6 (copy), LimitSelectAllResult (copy), UseMemoResult3 (copy), UseResult10 (copy)
		SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), {
			action = "select_all",
			kind = "Model",
			surface = UseStateResult.routeName,
			scope = if Params1.folderId == nil then "Root" else "Folder",
			hasQuery = tostring(UseStateResult6 ~= ""),
			selectedCount = tostring(#LimitSelectAllResult),
			matchCount = tostring(#UseMemoResult3)
		})
		UseResult10(LimitSelectAllResult, true)
	end
	
	local Title = if ItemId == nil then UseLibraryStringsModuleResult.title elseif Model == "Model" then UseLibraryStringsModuleResult.object elseif Model == "Image" then UseLibraryStringsModuleResult.image else UseLibraryStringsModuleResult.sound
	
	return ReactModule.createElement(FocusNavigationUtilsModule.FocusRoot, {
		isIsolated = true,
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
		isAutoFocusRoot = UseIsOpenResult,
		isFocusable = UseIsOpenResult
	}, {
		Experience = ReactModule.createElement(LibraryExperienceViewModule, {
			isOpen = UseIsOpenResult,
			showModeControl = IsAvailable and (ItemId ~= nil and Model == "Model"),
			isWorldAvailable = if UseSignalStateResult2 == nil or UseSignalStateResult2.model == nil then nil else UseSignalStateResult2.model:IsDescendantOf(workspace),
			title = if ItemId == nil then if UseLibraryWorldCutoutViewModelModuleResult.phase == "Expanding" or UseLibraryWorldCutoutViewModelModuleResult.phase == "World" then UseLibraryStringsModuleResult.world elseif Params == nil then UseLibraryStringsModuleResult.title else Params.title elseif UseSignalStateResult2 == nil then Title else UseSignalStateResult2.displayName,
			onBack = if FFlagBuildExperienceLibrary and not UseIsOpenResult and ItemId == nil then OnShowLibrary elseif ItemId == nil and Params == nil and UseStateResult.routeName ~= "Search" then if UseIsOpenResult then nil else OnShowLibrary else UseResult6,
			query = if ItemId == nil then UseStateResult1 else nil,
			searchPlaceholder = UseLibraryStringsModuleResult.searchPlaceholder,
			onQueryChanged = if ItemId == nil then UseResult3 else nil,
			onSearchReset = if ItemId == nil then UseResult4 else nil,
			selectAllLabel = LimitSelectAllResult2,
			onSelectAll = if #UseMemoResult3 > 0 then v148 else nil,
			assetLabel = Title,
			worldLabel = UseLibraryStringsModuleResult.world,
			onShowLibrary = OnShowLibrary,
			onShowWorld = OnShowWorld,
			onWorldViewportChanged = UseResult12,
			worldCutout = UseLibraryWorldCutoutViewModelModuleResult.view,
			onLeave = function()
				-- upvalues: returnToAppChat (copy)
				returnToAppChat(nil, "close_button")
			end
		}, (ReactModule.createElement(LibraryNavigatorModule, {
			externalDispatchConnector = UseResult1,
			onNavigationStateChange = UseResult2,
			screenProps = {
				library = Library,
				isReady = UseStateResult3,
				isOpen = UseIsOpenResult,
				activeRouteKey = UseStateResult.key,
				query = UseStateResult1,
				onBack = UseResult6,
				onOpenItem = UseResult8,
				onOpenCategory = UseResult7,
				chatActions = Copy,
				resourceActions = UseMemoResult,
				unavailableText = UseLibraryStringsModuleResult.modelUnavailable,
				worldCutout = if IsAvailable or FFlagBuildExperienceLibrary and not UseStateResult3 then {
					title = UseLibraryStringsModuleResult.world,
					onActivated = OnActivated,
					onRectChanged = UseLibraryWorldCutoutViewModelModuleResult.onCellRectChanged
				} else nil
			}
		}))),
		Leaving = if UseStateResult4 then ReactModule.createElement(LibraryLeavingOverlayModule, { ZIndex = 2 }) else nil,
		FirstFrameCover = if UseStateResult5 then nil else ReactModule.createElement(FoundationModule.View, {
			ZIndex = 3,
			tag = "size-full bg-surface-0",
			testId = "Library.FirstFrameCover"
		})
	})
end

return function(p4, SessionId)
	-- upvalues: v1 (ref), GetLibraryStoreModule (copy), CoreGui (copy), CreateBuildLibraryStoreModule (copy), ReactRobloxModule (copy), Localization (copy), LocalizationService (copy), ReactFocusNavigationModule (copy), ReactModule (copy), LocalizationProvider (copy), LibraryThemeProviderModule (copy), BuildExperienceCompositionStyleSheetModule (copy), FocusNavigationUtilsModule (copy), ConnectedLibrary (copy)
	if v1 == nil then
		GetLibraryStoreModule().setIsOpen(true)
		local BuildExperienceLibrary = Instance.new("ScreenGui")
		BuildExperienceLibrary.Name = "BuildExperienceLibrary"
		BuildExperienceLibrary.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
		BuildExperienceLibrary.ClipToDeviceSafeArea = false
		BuildExperienceLibrary.ResetOnSpawn = false
		BuildExperienceLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		BuildExperienceLibrary.DisplayOrder = 10
		BuildExperienceLibrary.Parent = CoreGui
		local BuildLibraryStoreModule = CreateBuildLibraryStoreModule(p4 or game)
		local Root = ReactRobloxModule.createRoot(BuildExperienceLibrary)
		v1 = Root
		local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
		local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
		ReactRobloxModule.flushSync(function()
			-- upvalues: Root (copy), ReactModule (upval), LocalizationProvider (upval), NewLocalization (copy), LibraryThemeProviderModule (upval), BuildExperienceCompositionStyleSheetModule (upval), ReactFocusNavigationModule (upval), NewResult (copy), FocusNavigationUtilsModule (upval), ConnectedLibrary (upval), p4 (copy), BuildLibraryStoreModule (copy), SessionId (copy), v1 (upval), BuildExperienceLibrary (copy)
			Root:render(ReactModule.createElement(LocalizationProvider, { localization = NewLocalization }, {
				FoundationProvider = ReactModule.createElement(LibraryThemeProviderModule, { displayOrder = 10 }, {
					CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
					Library = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
						Registry = ReactModule.createElement(FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider, nil, {
							Content = ReactModule.createElement(ConnectedLibrary, {
								dataModel = p4 or game,
								library = BuildLibraryStoreModule,
								sessionId = SessionId,
								onUnmount = function()
									-- upvalues: NewResult (upval), v1 (upval), BuildExperienceLibrary (upval)
									NewResult:teardown()
									v1 = nil
									BuildExperienceLibrary:Destroy()
								end
							})
						})
					})
				})
			}))
		end)
		
		return Root
	else
		return v1
	end
end