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
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local LibraryTypesModule = require(BuildExperience.Components.Library.LibraryTypes)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local Object = nil
local v1 = nil

local function _(Model: Model, p1)
	local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
	p1.requestFocus(BoundingCFrame.Position, BoundingSize.Magnitude / 2, Model)
end

local function focusModel(Model: Model, p1)
	-- upvalues: Object (ref), CoreGui (copy)
	if Object ~= nil then
		Object:Destroy()
	end
	local BuildLibraryFocusHighlight = Instance.new("Highlight")
	BuildLibraryFocusHighlight.Name = "BuildLibraryFocusHighlight"
	BuildLibraryFocusHighlight.DepthMode = Enum.HighlightDepthMode.Occluded
	BuildLibraryFocusHighlight.OutlineColor = Color3.fromRGB(0, 200, 255)
	BuildLibraryFocusHighlight.FillColor = Color3.fromRGB(0, 170, 255)
	BuildLibraryFocusHighlight.FillTransparency = 0.75
	BuildLibraryFocusHighlight.Adornee = Model
	BuildLibraryFocusHighlight.Parent = CoreGui
	Object = BuildLibraryFocusHighlight
	local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
	p1.requestFocus(BoundingCFrame.Position, BoundingSize.Magnitude / 2, Model)
end

local function requestWorldFocus(UseMemoResult, p1)
	local MinResult = nil
	local MaxResult = nil
	
	for _, Model in UseMemoResult do
		local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
		
		if BoundingSize ~= vector.create(0, 0, 0) then
			for X = -1, 1, 2 do
				for Y = -1, 1, 2 do
					for Z = -1, 1, 2 do
						local v2 = BoundingCFrame:PointToWorldSpace(BoundingSize * Vector3.new(X, Y, Z) / 2)
						
						if MinResult == nil then
							MinResult = v2
						else
							MinResult = MinResult:Min(v2)
						end
						if MaxResult == nil then
							MaxResult = v2
						else
							MaxResult = MaxResult:Max(v2)
						end
					end
				end
			end
		end
	end
	if MinResult ~= nil and MaxResult ~= nil then
		p1.requestFocus((MinResult + MaxResult) / 2, (MaxResult - MinResult).Magnitude / 2)
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
	-- upvalues: GetLibraryStoreModule (copy), ReactModule (copy), UseLibraryStringsModule (copy), SignalsReactModule (copy), UseLibraryWorldCutoutViewModelModule (copy), SendBuildExperienceEventModule (copy), RoactNavigationModule (copy), SignalsModule (copy), GetPlayButtonStoreModule (copy), FFlagBuildExperienceLibrary (copy), requestWorldFocus (copy), Object (ref), RunService (copy), LibraryTypesModule (copy), focusModel (copy), CreateViewerWorldPickerModule (copy), HttpService (copy), Default (copy), DeepLinkSource (copy), LeaveExperienceModule (copy), GetAndroidBackSignalModule (copy), BindLibraryBackInputModule (copy), LibraryNavigatorModule (copy), FocusNavigationUtilsModule (copy), LibraryExperienceViewModule (copy), LibraryLeavingOverlayModule (copy), FoundationModule (copy)
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
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseLibraryStringsModuleResult = UseLibraryStringsModule()
	local UseIsOpenResult = LibraryStoreModule.useIsOpen()
	local UseSignalStateResult = SignalsReactModule.useSignalState(LibraryStoreModule.getChatComposerState)
	local OnAddResource = if UseSignalStateResult == nil then nil else UseSignalStateResult.onAddResource
	local OnRemoveResourceByPath = if UseSignalStateResult == nil then nil else UseSignalStateResult.onRemoveResourceByPath
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: OnAddResource (copy), OnRemoveResourceByPath (copy), UseRefResult2 (copy), UseRefResult3 (copy), LibraryStoreModule (copy)
		return if OnAddResource == nil or OnRemoveResourceByPath == nil then {
			onAddResource = function(p3): boolean
				-- upvalues: LibraryStoreModule (upval)
				LibraryStoreModule.requestAddToChat(p3)
				
				return true
			end,
			onRemoveResource = LibraryStoreModule.requestRemoveFromChat
		} else {
			onAddResource = function(p3)
				-- upvalues: UseRefResult2 (upval), UseRefResult3 (upval), OnRemoveResourceByPath (upval), OnAddResource (upval)
				local Current = UseRefResult2.current
				
				if Current ~= nil and Current ~= p3.path then
					UseRefResult2.current = nil
					UseRefResult3.current = nil
					OnRemoveResourceByPath(Current)
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
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult4 (copy)
		UseRefResult4.current = Current
		
		return function()
			-- upvalues: UseRefResult4 (upval)
			UseRefResult4.current = nil
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(_, p3)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p3.routes[p3.index])
	end, {})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2_1 (copy), UseRefResult4 (copy), UseStateResult (copy), RoactNavigationModule (upval), Params (copy), UseRefResult5 (copy), SendBuildExperienceEventModule (upval), UseResult (copy)
		UseStateResult2_1(p3)
		local CurrentFunction: (any) -> () = UseRefResult4.current
		
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
		if UseRefResult5.current ~= nil then
			task.cancel(UseRefResult5.current)
		end
		UseRefResult5.current = task.delay(0.3, function()
			-- upvalues: UseRefResult5 (upval), SendBuildExperienceEventModule (upval), UseResult (upval), Params (upval), p3 (copy)
			UseRefResult5.current = nil
			SendBuildExperienceEventModule("LIBRARY_SEARCH", UseResult(), {
				surface = if Params == nil then "Browser" else "Category",
				kind = if Params == nil then "All" else Params.itemKind,
				scope = if Params == nil or Params.folderId == nil then "Root" else "Folder",
				hasQuery = tostring(p3 ~= "")
			})
		end)
	end, { UseResult, UseStateResult, Params or false })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult5 (copy)
		return function()
			-- upvalues: UseRefResult5 (upval)
			if UseRefResult5.current ~= nil then
				task.cancel(UseRefResult5.current)
				UseRefResult5.current = nil
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
		-- upvalues: UseRefResult4 (copy), UseStateResult (copy), UseStateResult2_1 (copy), UseResult5 (copy), LibraryStoreModule (copy), GetPlayButtonStoreModule (upval), RoactNavigationModule (upval)
		local CurrentFunction: (any) -> () = UseRefResult4.current
		
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
		-- upvalues: UseResult5 (copy), UseStateResult2_1 (copy), UseRefResult4 (copy), SendBuildExperienceEventModule (upval), UseResult (copy), UseStateResult (copy), RoactNavigationModule (upval)
		UseResult5()
		
		if FolderId ~= nil then
			UseStateResult2_1("")
		end
		local CurrentFunction: (any) -> () = UseRefResult4.current
		
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
		-- upvalues: UseRefResult4 (copy), Library (copy), SendBuildExperienceEventModule (upval), UseResult (copy), LibraryStoreModule (copy), UseStateResult (copy), RoactNavigationModule (upval)
		local CurrentFunction: (any) -> () = UseRefResult4.current
		
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
	local UseRefResult6 = ReactModule.useRef(false)
	local UseRefResult7 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult6 (copy), UseMemoResult1 (copy), UseIsOpenResult (copy), UseLibraryWorldCutoutViewModelModuleResult (copy), UseStateResult3 (copy), FFlagBuildExperienceLibrary (upval), IsAvailable (copy), requestWorldFocus (upval), UseMemoResult2 (copy), LibraryStoreModule (copy), UseSignalStateResult1 (copy), UseRefResult7 (copy)
		if UseRefResult6.current or UseMemoResult1 == nil then return end
		if not UseIsOpenResult or UseLibraryWorldCutoutViewModelModuleResult.phase ~= "Home" then
			UseRefResult6.current = true
			
			return
		end
		if not UseStateResult3 or not UseLibraryWorldCutoutViewModelModuleResult.isMeasured then return end
		if not FFlagBuildExperienceLibrary then
			local Model = nil
			for _, value in UseSignalStateResult1 do
				Model = value.model
				
				if value.folderId == nil and value.className ~= "Folder" and Model ~= nil and Model:IsDescendantOf(UseMemoResult1) then
					UseRefResult6.current = true
					UseRefResult7.current = Model
					local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
					LibraryStoreModule.requestFocus(BoundingCFrame.Position, BoundingSize.Magnitude / 2, Model)
					break
				end
			end
			return
		elseif IsAvailable then
			UseRefResult6.current = true
			requestWorldFocus(UseMemoResult2, LibraryStoreModule)
		end
	end, {
		UseSignalStateResult1, UseStateResult3, UseIsOpenResult,
		UseLibraryWorldCutoutViewModelModuleResult.phase,
		UseLibraryWorldCutoutViewModelModuleResult.isMeasured, UseMemoResult1,
		LibraryStoreModule, IsAvailable, UseMemoResult2
	})
	local IsBrowser: boolean = UseIsOpenResult and UseStateResult.routeName == "Browser"
	local UseRefResult8 = ReactModule.useRef(IsBrowser)
	ReactModule.useEffect(function()
		-- upvalues: FFlagBuildExperienceLibrary (upval), IsBrowser (copy), UseRefResult8 (copy), UseRefResult6 (copy), IsAvailable (copy), requestWorldFocus (upval), UseMemoResult2 (copy), LibraryStoreModule (copy), UseRefResult7 (copy), UseMemoResult1 (copy)
		if FFlagBuildExperienceLibrary then
			if IsBrowser and not UseRefResult8.current and UseRefResult6.current and IsAvailable then
				requestWorldFocus(UseMemoResult2, LibraryStoreModule)
			end
			UseRefResult8.current = IsBrowser
			
			return
		else
			local Current = UseRefResult7.current
			local FocusRequest = LibraryStoreModule.getFocusRequest(false)
			
			if IsBrowser and not UseRefResult8.current and Current ~= nil and UseMemoResult1 ~= nil and Current:IsDescendantOf(UseMemoResult1) and (FocusRequest == nil or FocusRequest.model ~= Current) then
				local BoundingCFrame, BoundingSize = Current:GetBoundingBox()
				LibraryStoreModule.requestFocus(BoundingCFrame.Position, BoundingSize.Magnitude / 2, Current)
			end
			UseRefResult8.current = IsBrowser
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
	local UseRefResult9 = ReactModule.useRef(false)
	local UseResult9 = ReactModule.useCallback(function(Reason)
		-- upvalues: UseRefResult9 (copy), SendBuildExperienceEventModule (upval), UseResult (copy), Browser (copy)
		if not UseRefResult9.current then
			UseRefResult9.current = true
			SendBuildExperienceEventModule("LIBRARY_IMPRESSION", UseResult(), {
				phase = "closed",
				reason = Reason,
				surface = Browser.current
			})
			
			return
		end
	end, { UseResult })
	local UseRefResult10 = ReactModule.useRef(UseResult9)
	UseRefResult10.current = UseResult9
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult10 (copy)
		return function()
			-- upvalues: UseRefResult10 (upval)
			UseRefResult10.current("other")
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), Object (upval)
		game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
		
		return function()
			-- upvalues: p2 (upval), Object (upval)
			p2.onUnmount()
			
			if Object ~= nil then
				Object:Destroy()
				Object = nil
			end
		end
	end, { p2.onUnmount })
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseRefResult11 = ReactModule.useRef(false)
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
		-- upvalues: IsBrowser (copy), Object (upval)
		if IsBrowser and Object ~= nil then
			Object:Destroy()
			Object = nil
		end
	end, { IsBrowser })
	local UseRefResult12 = ReactModule.useRef(0)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult2 (copy), UseRefResult12 (copy), LibraryStoreModule (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseMemoResult (copy), LibraryTypesModule (upval), Object (upval), UseResult5 (copy)
		if UseSignalStateResult2 == nil or UseSignalStateResult2.model == nil then return end
		local Flag = true
		local DestroyingConnection = UseSignalStateResult2.model.Destroying:Connect(function()
			-- upvalues: UseRefResult12 (upval), LibraryStoreModule (upval), UseRefResult2 (upval), UseRefResult3 (upval), UseMemoResult (upval), LibraryTypesModule (upval), UseSignalStateResult2 (upval), Object (upval), Flag (ref), UseResult5 (upval)
			UseRefResult12.current += 1
			LibraryStoreModule.clearFocus()
			UseRefResult2.current = nil
			UseRefResult3.current = nil
			UseMemoResult.onRemoveResource(LibraryTypesModule.toChatResource(UseSignalStateResult2))
			
			if Object ~= nil then
				Object:Destroy()
				Object = nil
			end
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
	local UseRefResult13 = ReactModule.useRef(false)
	local UseRefResult14 = ReactModule.useRef(nil)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(LibraryStoreModule.getPromptFailure)
	local UseRefResult15 = ReactModule.useRef(if UseSignalStateResult4 == nil then 0 else UseSignalStateResult4.token)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult4 (copy), UseRefResult15 (copy), UseRefResult14 (copy), SendBuildExperienceEventModule (upval), UseResult (copy)
		if UseSignalStateResult4 == nil or UseSignalStateResult4.token <= UseRefResult15.current then return end
		UseRefResult15.current = UseSignalStateResult4.token
		local Current = UseRefResult14.current
		
		if Current == nil then return end
		UseRefResult14.current = nil
		local Copy = table.clone(Current)
		Copy.phase = "failed"
		
		if UseSignalStateResult4.errorCode ~= nil then
			Copy.errorCode = tostring(UseSignalStateResult4.errorCode)
		end
		SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), Copy)
	end, { UseSignalStateResult4, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult13 (copy), IsIsAssistantResponding (copy), UseRefResult14 (copy), UseStateResult3 (copy), UseIsOpenResult (copy), UseResult5 (copy)
		if UseRefResult13.current and not IsIsAssistantResponding then
			UseRefResult14.current = nil
		end
		if UseRefResult13.current and not IsIsAssistantResponding and UseStateResult3 and UseIsOpenResult then
			UseResult5()
		end
		UseRefResult13.current = IsIsAssistantResponding
	end, {
		IsIsAssistantResponding,
		UseStateResult3,
		UseIsOpenResult,
		UseResult5
	})
	local UseResult10 = ReactModule.useCallback(function(p3, p4)
		-- upvalues: focusModel (upval), LibraryStoreModule (copy), UseRefResult12 (copy), LibraryTypesModule (upval), UseRefResult2 (copy), UseRefResult3 (copy), GetPlayButtonStoreModule (upval)
		if p3.model ~= nil and not p3.model:IsDescendantOf(workspace) then return end
		if p3.model ~= nil then
			focusModel(p3.model, LibraryStoreModule)
		end
		LibraryStoreModule.setIsOpen(false)
		UseRefResult12.current += 1
		local Current = UseRefResult12.current
		task.defer(function()
			-- upvalues: UseRefResult12 (upval), Current (copy), LibraryStoreModule (upval), LibraryTypesModule (upval), p3 (copy), UseRefResult2 (upval), p4 (copy), UseRefResult3 (upval), GetPlayButtonStoreModule (upval)
			if UseRefResult12.current == Current and not LibraryStoreModule.getIsOpen(false) then
				local ChatResource = LibraryTypesModule.toChatResource(p3)
				LibraryStoreModule.requestAddToChat(ChatResource, UseRefResult2.current, p4)
				UseRefResult2.current = ChatResource.path
				UseRefResult3.current = ChatResource
				GetPlayButtonStoreModule().setIsActive(true)
				
				return
			end
		end)
	end, { LibraryStoreModule })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult12 (copy)
		return function()
			-- upvalues: UseRefResult12 (upval)
			UseRefResult12.current += 1
		end
	end, {})
	local UseSignalStateResult5 = SignalsReactModule.useSignalState(LibraryStoreModule.getChipEvent)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), UseSignalStateResult5 (copy), LibraryTypesModule (upval), UseRefResult2 (copy), Object (upval), Library (copy), focusModel (upval), LibraryStoreModule (copy)
		local Current = UseRefResult3.current
		
		if UseSignalStateResult5 == nil or Current == nil then return end
		if not table.find(UseSignalStateResult5.uris, LibraryTypesModule.toResourceUri(Current.path)) then return end
		if UseSignalStateResult5.kind == "Removed" then
			UseRefResult2.current = nil
			UseRefResult3.current = nil
			
			if Object ~= nil then
				Object:Destroy()
				Object = nil
				
				return
			end
		elseif UseSignalStateResult5.kind == "Activated" then
			for _, value in Library.getItems(false) do
				if value.path == Current.path and value.model ~= nil and value.model:IsDescendantOf(workspace) then
					focusModel(value.model, LibraryStoreModule)
				end
			end
			return
		else
			LibraryStoreModule.requestAddToChat(Current, nil, false)
		end
	end, {
		UseSignalStateResult5,
		LibraryStoreModule,
		Library.getItems
	})
	ReactModule.useEffect(function()
		-- upvalues: UseIsOpenResult (copy), UseStateResult3 (copy), IsAvailable (copy), p2 (copy), CreateViewerWorldPickerModule (upval), LibraryStoreModule (copy), Library (copy), UseResult5 (copy), UseResult8 (copy), UseResult10 (copy), GetPlayButtonStoreModule (upval), UseRefResult3 (copy), UseRefResult2 (copy), UseMemoResult (copy), Object (upval)
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
				onPick = function(p3)
					-- upvalues: Library (upval), UseResult5 (upval), UseResult8 (upval), UseResult10 (upval), GetPlayButtonStoreModule (upval)
					local ResolveWorldItemResult = Library.resolveWorldItem(p3)
					
					if ResolveWorldItemResult == nil then
						UseResult5()
						ResolveWorldItemResult = Library.resolveWorldItem(p3)
					end
					if ResolveWorldItemResult ~= nil then
						UseResult8(ResolveWorldItemResult.id, ResolveWorldItemResult.kind)
						UseResult10(ResolveWorldItemResult, not GetPlayButtonStoreModule().getIsActive(false))
					end
				end,
				onMiss = function()
					-- upvalues: UseRefResult3 (upval), UseRefResult2 (upval), UseMemoResult (upval), Object (upval)
					local Current = UseRefResult3.current
					
					if Current == nil then return end
					UseRefResult2.current = nil
					UseRefResult3.current = nil
					UseMemoResult.onRemoveResource(Current)
					
					if Object ~= nil then
						Object:Destroy()
						Object = nil
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
		UseResult5, UseResult10, UseResult8, UseMemoResult, p2.dataModel
	})
	
	local function OnShowLibrary()
		-- upvalues: UseStateResult3 (copy), UseResult5 (copy), LibraryStoreModule (copy), SendBuildExperienceEventModule (upval), UseResult (copy), UseLibraryWorldCutoutViewModelModuleResult (copy), Model (copy), UseRefResult12 (copy), GetPlayButtonStoreModule (upval)
		if UseStateResult3 then
			UseResult5()
		end
		if not LibraryStoreModule.getIsOpen(false) then
			SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), if UseLibraryWorldCutoutViewModelModuleResult.exit() then {
				action = "back",
				kind = "All",
				surface = "World",
				source = "home_cutout"
			} else { action = "object", surface = "World", kind = Model })
		end
		UseRefResult12.current += 1
		GetPlayButtonStoreModule().setIsActive(false)
		LibraryStoreModule.setIsOpen(true)
	end
	
	local UseResult11 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: LibraryStoreModule (copy)
		LibraryStoreModule.setWorldViewportRect(if Frame == nil then nil else Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize))
	end, { LibraryStoreModule })
	
	local function OnShowWorld(p3)
		-- upvalues: ItemId (copy), Library (copy), LibraryStoreModule (copy), UseResult10 (copy), SendBuildExperienceEventModule (upval), UseResult (copy)
		if ItemId ~= nil then
			local Item = Library.getItem(false, ItemId)
			
			if Item ~= nil then
				local IsOpen = LibraryStoreModule.getIsOpen(false)
				UseResult10(Item, p3 ~= "prompt")
				local Inverted: boolean = IsOpen and not LibraryStoreModule.getIsOpen(false)
				
				if Inverted or IsOpen and Item.model ~= nil and not Item.model:IsDescendantOf(workspace) then
					SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), {
						action = "world",
						surface = "Detail",
						outcome = if Inverted then nil else "unavailable",
						kind = Item.kind,
						source = p3 or "segmented_control",
						location = Item.rootName
					})
				end
				return
			end
		end
		LibraryStoreModule.setIsOpen(false)
	end
	
	local function OnActivated()
		-- upvalues: UseStateResult (copy), LibraryStoreModule (copy), UseLibraryWorldCutoutViewModelModuleResult (copy), SendBuildExperienceEventModule (upval), UseResult (copy), FFlagBuildExperienceLibrary (upval), requestWorldFocus (upval), UseMemoResult2 (copy), OnShowWorld (copy)
		if UseStateResult.routeName ~= "Browser" or not LibraryStoreModule.getIsOpen(false) or not UseLibraryWorldCutoutViewModelModuleResult.enter() then return end
		SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), {
			action = "world",
			kind = "All",
			surface = "Home",
			source = "home_cutout"
		})
		
		if FFlagBuildExperienceLibrary then
			requestWorldFocus(UseMemoResult2, LibraryStoreModule)
		end
		OnShowWorld()
	end
	
	local function returnToAppChat(p3, p4)
		-- upvalues: UseRefResult11 (copy), UseStateResult2_3 (copy), UseResult9 (copy), p2 (copy), HttpService (upval), Default (upval), DeepLinkSource (upval), LeaveExperienceModule (upval)
		if UseRefResult11.current then return end
		UseRefResult11.current = true
		UseStateResult2_3(true)
		UseResult9(p4)
		local P28 = p3 or p2.sessionId
		local NavigationName: string = `roblox://navigation/build?universeid={p2.dataModel.GameId}`
		
		if P28 ~= nil then
			NavigationName ..= `&sessionid={HttpService:UrlEncode(P28)}`
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
		-- upvalues: UseRefResult11 (copy), UseIsOpenResult (copy), OnShowLibrary (copy), UseStateResult (copy), returnToAppChat (copy), UseResult6 (copy)
		if UseRefResult11.current then return end
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
	
	local UseRefResult16 = ReactModule.useRef(onNavigateBack)
	UseRefResult16.current = onNavigateBack
	local UseRefResult17 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult16 (copy), GetAndroidBackSignalModule (upval), BindLibraryBackInputModule (upval), UseRefResult17 (copy)
		local function navigateBack()
			-- upvalues: UseRefResult16 (upval)
			UseRefResult16.current()
		end
		
		local Connection = GetAndroidBackSignalModule():Connect(navigateBack)
		local BindLibraryBackInputModuleResult = BindLibraryBackInputModule(navigateBack)
		UseRefResult17.current = BindLibraryBackInputModuleResult
		
		return function()
			-- upvalues: Connection (copy), BindLibraryBackInputModuleResult (copy), UseRefResult17 (upval)
			Connection:Disconnect()
			BindLibraryBackInputModuleResult.unbind()
			UseRefResult17.current = nil
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult17 (copy), UseSignalStateResult3 (copy)
		if UseRefResult17.current ~= nil then
			UseRefResult17.current.setChatOpen(UseSignalStateResult3)
		end
	end, { UseSignalStateResult3 })
	local Copy = if UseSignalStateResult == nil then nil else table.clone(UseSignalStateResult)
	
	if Copy ~= nil and UseSignalStateResult ~= nil then
		local OnSendFunction = UseSignalStateResult.onSend
		
		function Copy.onSend()
			-- upvalues: Model (copy), UseSignalStateResult2 (copy), SendBuildExperienceEventModule (upval), UseResult (copy), OnSendFunction (copy), returnToAppChat (copy), UseRefResult14 (copy), OnShowWorld (copy)
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
			
			local OnSendResult = if Model == "Image" or Model == "Sound" then OnSendFunction(function(p3)
				-- upvalues: Tbl (copy), SendBuildExperienceEventModule (upval), UseResult (upval), returnToAppChat (upval)
				local Copy = table.clone(Tbl)
				Copy.phase = "received"
				SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", UseResult(), Copy)
				returnToAppChat(p3, "prompt_return")
			end) else OnSendFunction(onPromptAccepted)
			
			if OnSendResult then
				UseRefResult14.current = Tbl
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
			onBack = if ItemId == nil and (Params == nil and UseStateResult.routeName ~= "Search") then if UseIsOpenResult then nil else OnShowLibrary else UseResult6,
			query = if ItemId == nil then UseStateResult1 else nil,
			searchPlaceholder = UseLibraryStringsModuleResult.searchPlaceholder,
			onQueryChanged = if ItemId == nil then UseResult3 else nil,
			onSearchReset = if ItemId == nil then UseResult4 else nil,
			assetLabel = Title,
			worldLabel = UseLibraryStringsModuleResult.world,
			onShowLibrary = OnShowLibrary,
			onShowWorld = OnShowWorld,
			onWorldViewportChanged = UseResult11,
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

return function(p3, SessionId)
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
		local BuildLibraryStoreModule = CreateBuildLibraryStoreModule(p3 or game)
		local Root = ReactRobloxModule.createRoot(BuildExperienceLibrary)
		v1 = Root
		local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
		local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
		ReactRobloxModule.flushSync(function()
			-- upvalues: Root (copy), ReactModule (upval), LocalizationProvider (upval), NewLocalization (copy), LibraryThemeProviderModule (upval), BuildExperienceCompositionStyleSheetModule (upval), ReactFocusNavigationModule (upval), NewResult (copy), FocusNavigationUtilsModule (upval), ConnectedLibrary (upval), p3 (copy), BuildLibraryStoreModule (copy), SessionId (copy), v1 (upval), BuildExperienceLibrary (copy)
			Root:render(ReactModule.createElement(LocalizationProvider, { localization = NewLocalization }, {
				FoundationProvider = ReactModule.createElement(LibraryThemeProviderModule, { displayOrder = 10 }, {
					CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
					Library = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
						Registry = ReactModule.createElement(FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider, nil, {
							Content = ReactModule.createElement(ConnectedLibrary, {
								dataModel = p3 or game,
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