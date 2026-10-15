local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local reactRobloxModule = require(parent.ReactRoblox)
local roactNavigationModule = require(parent.RoactNavigation)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local robloxAppLocalesModule = require(parent.RobloxAppLocales)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local libraryThemeProviderModule = require(buildExperience.Components.Library.LibraryThemeProvider)
local libraryLeavingOverlayModule = require(buildExperience.Components.Library.LibraryLeavingOverlay)
local _ = require(buildExperience.Components.Library.LibraryDetail.LibraryDetailContainer)
local libraryExperienceViewModule = require(buildExperience.Components.Library.LibraryExperienceView)
local libraryNavigatorModule = require(buildExperience.Components.Library.LibraryNavigator)
local useLibraryWorldCutoutViewModelModule = require(buildExperience.Components.Library.LibraryWorldCutout.useLibraryWorldCutoutViewModel)
local getAndroidBackSignalModule = require(buildExperience.utils.getAndroidBackSignal)
local bindLibraryBackInputModule = require(buildExperience.utils.bindLibraryBackInput)
local leaveExperienceModule = require(buildExperience.utils.leaveExperience)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local _ = require(buildExperience.Components.Library.LibraryCategories)
local createBuildLibraryStoreModule = require(buildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local useLibraryStringsModule = require(buildExperience.Components.Library.useLibraryStrings)
local getLibraryStoreModule = require(buildExperience.Stores.GetLibraryStore)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local createViewerWorldPickerModule = require(buildExperience.createViewerWorldPicker)
local localizationProvider = localizationModule.LocalizationProvider
local localization = robloxAppLocalesModule.Localization
local libraryTypesModule = require(buildExperience.Components.Library.LibraryTypes)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceLibrary = require(parent.SharedFlags).FFlagBuildExperienceLibrary
local var1 = nil
local var2 = nil

local function _(p1, p2)
	local boundingBox, boundingBox_1 = p1:GetBoundingBox()
	p2.requestFocus(boundingBox.Position, boundingBox_1.Magnitude / 2, p1)
end

local function focusModel(p1, p2)
	-- upvalues: var1 (write), coreGuiService (ref)
	if var1 ~= nil then
		var1:Destroy()
	end
	local buildLibraryFocusHighlight = Instance.new("Highlight")
	buildLibraryFocusHighlight.Name = "BuildLibraryFocusHighlight"
	buildLibraryFocusHighlight.DepthMode = Enum.HighlightDepthMode.Occluded
	buildLibraryFocusHighlight.OutlineColor = Color3.fromRGB(0, 200, 255)
	buildLibraryFocusHighlight.FillColor = Color3.fromRGB(0, 170, 255)
	buildLibraryFocusHighlight.FillTransparency = 0.75
	buildLibraryFocusHighlight.Adornee = p1
	buildLibraryFocusHighlight.Parent = coreGuiService
	var1 = buildLibraryFocusHighlight
	local boundingBox, boundingBox_1 = p1:GetBoundingBox()
	p2.requestFocus(boundingBox.Position, boundingBox_1.Magnitude / 2, p1)
end

local function requestWorldFocus(p1, p2)
	local var3 = nil
	local var4 = nil
	
	for i, v in p1 do
		local boundingBox, boundingBox_1 = v:GetBoundingBox()
		
		if boundingBox_1 ~= Vector3.new(0, 0, 0) then
			for i_3 = -1, 1, 2 do
				for i_2 = -1, 1, 2 do
					for i_1 = -1, 1, 2 do
						local var5 = boundingBox:PointToWorldSpace(boundingBox_1 * Vector3.new(i_3, i_2, i_1) / 2)
						var3 = if var3 == nil then var5 else var3:Min(var5)
						var4 = if var4 == nil then var5 else var4:Max(var5)
					end
				end
			end
		end
	end
	if var3 ~= nil and var4 ~= nil then
		p2.requestFocus((var3 + var4) / 2, (var4 - var3).Magnitude / 2)
	end
end

local _ = function(p3)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref)
		return p3:GetService("Workspace")
	end)
	
	return if ok and typeof(status) == "Instance" and status:IsA("Workspace") then status else nil
end

local function ConnectedLibrary(p3)
	-- upvalues: getLibraryStoreModule (ref), reactModule (ref), useLibraryStringsModule (ref), signalsReactModule (ref), useLibraryWorldCutoutViewModelModule (ref), sendBuildExperienceEventModule (ref), roactNavigationModule (ref), signalsModule (ref), getPlayButtonStoreModule (ref), fFlagBuildExperienceLibrary (ref), requestWorldFocus (ref), var1 (write), runService (ref), libraryTypesModule (ref), focusModel (ref), createViewerWorldPickerModule (ref), httpService (ref), leaveExperienceModule (ref), default (ref), getAndroidBackSignalModule (ref), bindLibraryBackInputModule (ref), libraryNavigatorModule (ref), focusNavigationUtilsModule (ref), libraryExperienceViewModule (ref), libraryLeavingOverlayModule (ref), foundationModule (ref)
	local var6 = getLibraryStoreModule()
	local var7 = reactModule.useRef(os.clock())
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useCallback(function()
		-- upvalues: p3 (ref)
		return {
			universeId = p3.dataModel.GameId,
			placeId = p3.dataModel.PlaceId
		}
	end, { p3.dataModel })
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12 = useLibraryStringsModule()
	local var13 = var6.useIsOpen()
	local var14 = signalsReactModule.useSignalState(var6.getChatComposerState)
	local var15 = if var14 ~= nil then nil else var14.onAddResource
	local var16 = if var14 ~= nil then nil else var14.onRemoveResourceByPath
	local var17 = reactModule.useMemo(function()
		-- upvalues: var15 (ref), var16 (ref), var10 (ref), var11 (ref), var6 (ref)
		return if var15 == nil or var16 == nil then {
			onAddResource = function(p4)
				-- upvalues: var6 (copy)
				var6.requestAddToChat(p4)
				
				return true
			end,
			onRemoveResource = var6.requestRemoveFromChat
		} else {
			onAddResource = function(p4)
				-- upvalues: var10 (copy), var11 (copy), var16 (copy), var15 (copy)
				local current = var10.current
				
				if current ~= nil and current ~= p4.path then
					var10.current = nil
					var11.current = nil
					var16(current)
				end
				return var15(p4)
			end,
			onRemoveResource = function(p4)
				-- upvalues: var16 (copy)
				var16(p4.path)
			end
		}
	end, { var15 or false, var16 or false, var6 })
	local var18, var19 = reactModule.useState({ routeName = "Browser" })
	local var20 = if var18.routeName == "Detail" then var18.params.itemId else nil
	local var21 = if var20 ~= nil then "Model" else var18.params.itemKind
	local var22 = if var18.routeName == "Category" or var18.routeName == "Search" and var18.params.itemKind ~= nil then var18.params else nil
	local var23 = reactModule.useMemo(function()
		-- upvalues: p3 (ref)
		local dataModel = p3.dataModel
		local ok, status = pcall(function()
			-- upvalues: dataModel (ref)
			return dataModel:GetService("Workspace")
		end)
		
		return if ok and typeof(status) == "Instance" and status:IsA("Workspace") then status else nil
	end, { p3.dataModel })
	local var24 = signalsReactModule.useSignalState(p3.library.getItems)
	local var25 = reactModule.useMemo(function()
		-- upvalues: var23 (ref), p3 (ref), var24 (ref)
		local t = {}
		
		if var23 == nil then
			return t
		end
		local playersService = p3.dataModel:GetService("Players")
		
		for i, v in var24 do
			local model = v.model
			
			if model ~= nil and model:IsDescendantOf(var23) and playersService:GetPlayerFromCharacter(model) == nil then
				table.insert(t, model)
			end
		end
		return t
	end, { var23, var24, p3.dataModel })
	local var26 = #var25 > 0
	local var27 = useLibraryWorldCutoutViewModelModule({
		isAvailable = var26,
		isHome = var18.routeName == "Browser",
		isOpen = var13,
		onViewportRectChanged = var6.setWorldViewportRect
	})
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), p3 (ref), sendBuildExperienceEventModule (copy), var9 (ref), var13 (ref), var18 (ref), var21 (ref), var22 (ref)
		local var28 = if var20 ~= nil then nil else p3.library.getItem(false, var20)
		sendBuildExperienceEventModule("LIBRARY_IMPRESSION", var9(), {
			phase = "viewed",
			surface = if var13 then var18.routeName else "World",
			kind = if var20 ~= nil then if var22 ~= nil then "All" else var22.itemKind else var21,
			scope = if var22 == nil or var22.folderId == nil then "Root" else "Folder",
			hasDescription = if var28 ~= nil then nil else tostring(var28.description ~= nil),
			location = if var28 ~= nil then nil else var28.rootName
		})
	end, {
		p3.library, var9, var13, var18.routeName, var20 or false, var21,
		if var22 ~= nil then false else var22.folderId or var22.itemKind
	})
	local var28 = reactModule.useRef(nil)
	local var29 = reactModule.useCallback(function(p4)
		-- upvalues: var28 (ref)
		var28.current = p4
		
		return function()
			-- upvalues: var28 (copy)
			var28.current = nil
		end
	end, {})
	local var30 = reactModule.useCallback(function(_, p4)
		-- upvalues: var19 (ref)
		var19(p4.routes[p4.index])
	end, {})
	local var31, var32 = reactModule.useState("")
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useCallback(function(p4)
		-- upvalues: var32 (ref), var28 (ref), var18 (ref), roactNavigationModule (copy), var22 (ref), var33 (ref), sendBuildExperienceEventModule (copy), var9 (ref)
		var32(p4)
		local current = var28.current
		
		if current ~= nil then
			local reducedMotion = UserSettings():GetService("UserGameSettings").ReducedMotion
			
			if p4 ~= "" and var18.routeName ~= "Search" then
				current(roactNavigationModule.Actions.navigate({
					routeName = "Search",
					key = "LibrarySearch",
					params = var22 or {},
					immediate = reducedMotion
				}))
			elseif p4 == "" and var18.routeName == "Search" then
				current(roactNavigationModule.StackActions.pop({ immediate = reducedMotion }))
			end
		end
		if var33.current ~= nil then
			task.cancel(var33.current)
		end
		var33.current = task.delay(0.3, function()
			-- upvalues: var33 (copy), sendBuildExperienceEventModule (copy), var9 (copy), var22 (copy), p4 (ref)
			var33.current = nil
			sendBuildExperienceEventModule("LIBRARY_SEARCH", var9(), {
				surface = if var22 ~= nil then "Browser" else "Category",
				kind = if var22 ~= nil then "All" else var22.itemKind,
				scope = if var22 == nil or var22.folderId == nil then "Root" else "Folder",
				hasQuery = tostring(p4 ~= "")
			})
		end)
	end, { var9, var18, var22 or false })
	local useEffect = reactModule.useEffect
	
	local var35 = function()
		-- upvalues: var33 (ref)
		return function()
			-- upvalues: var33 (copy)
			if var33.current ~= nil then
				task.cancel(var33.current)
				var33.current = nil
			end
		end
	end
	
	local t = {}
	local var36 = var20 or false
	local var37 = if var22 ~= nil then false else var22.itemKind
	local var38 = var22 == nil and ((if var22 == nil then var22.folderId else nil) or false)
	-- Unknown statement at pc 0: <SetList>
	useEffect(var35, t)
	local var39 = reactModule.useCallback(function()
		-- upvalues: var34 (ref)
		var34("")
	end, { var34 })
	local library = p3.library
	local var40, var41 = reactModule.useState(false)
	local var42 = reactModule.useCallback(function()
		-- upvalues: library (ref), sendBuildExperienceEventModule (copy), var9 (ref), var8 (ref)
		local ok, status = pcall(function()
			-- upvalues: library (copy)
			library.refresh()
			
			return nil
		end)
		
		if not ok then
			sendBuildExperienceEventModule("LIBRARY_FETCH_FAILED", var9(), {
				surface = "Library",
				reason = "refresh_failed",
				phase = if var8.current then "refresh" else "initial"
			})
			error(status, 0)
		end
	end, { library, var9 })
	reactModule.useEffect(function()
		-- upvalues: sendBuildExperienceEventModule (copy), var9 (ref), p3 (ref), var42 (ref), var41 (ref), var8 (ref), library (ref), var7 (ref)
		sendBuildExperienceEventModule("LIBRARY_IMPRESSION", var9(), { phase = "opened", surface = "Library" })
		local dataModel = p3.dataModel
		
		local function ready()
			-- upvalues: var42 (copy), var41 (copy), var8 (copy), library (copy), sendBuildExperienceEventModule (copy), var9 (copy), var7 (copy)
			var42()
			var41(true)
			
			if not var8.current then
				var8.current = true
				local t = { Model = 0, Image = 0, Sound = 0, Folder = 0 }
				
				for i, v in library.getItems(false) do
					t[if v.className == "Folder" then "Folder" else v.kind] += 1
				end
				sendBuildExperienceEventModule("LIBRARY_IMPRESSION", var9(), {
					phase = "ready",
					surface = "Library",
					durationMs = tostring(math.round((os.clock() - var7.current) * 1000)),
					modelCount = tostring(t.Model),
					imageCount = tostring(t.Image),
					soundCount = tostring(t.Sound),
					folderEntryCount = tostring(t.Folder)
				})
			end
		end
		
		local loadedConnection = dataModel.Loaded:Connect(ready)
		local persistentLoadedConnection = dataModel:GetService("Workspace").PersistentLoaded:Connect(ready)
		
		if dataModel:IsLoaded() then
			ready()
		end
		return function()
			-- upvalues: loadedConnection (ref), persistentLoadedConnection (ref)
			loadedConnection:Disconnect()
			persistentLoadedConnection:Disconnect()
		end
	end, { library, p3.dataModel, var42, var9 })
	local var43 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var20 (ref), library (ref)
		return signalsModule.createComputed(function(p4)
			-- upvalues: var20 (copy), library (copy)
			return if var20 == nil then nil else library.getItem(p4, var20)
		end)
	end, { library, var20 or false }))
	local var44 = reactModule.useCallback(function()
		-- upvalues: var28 (ref), var18 (ref), var32 (ref), var42 (ref), var6 (ref), getPlayButtonStoreModule (copy), roactNavigationModule (copy)
		local current = var28.current
		
		if var18.routeName == "Browser" or current == nil then
			var6.setIsOpen(false)
			
			return
		elseif var18.routeName == "Search" then
			var32("")
		else
			var42()
		end
		var6.setIsOpen(true)
		getPlayButtonStoreModule().setIsActive(false)
		current(roactNavigationModule.StackActions.pop({
			immediate = var18.routeName == "Search" and UserSettings():GetService("UserGameSettings").ReducedMotion
		}))
	end, { var18.routeName, var6, var42 })
	local var45 = reactModule.useCallback(function(p4, p5, p6, p7)
		-- upvalues: var42 (ref), var32 (ref), var28 (ref), sendBuildExperienceEventModule (copy), var9 (ref), var18 (ref), roactNavigationModule (copy)
		var42()
		
		if p7 ~= nil then
			var32("")
		end
		local current = var28.current
		
		if current ~= nil then
			sendBuildExperienceEventModule("LIBRARY_CATEGORY_CLICK", var9(), {
				action = if p7 ~= nil then "category" else "folder",
				kind = p4,
				surface = var18.routeName
			})
			current(roactNavigationModule.Actions.navigate({
				routeName = "Category",
				key = if p7 ~= nil then "LibraryCategory" else `LibraryFolder:{p7}`,
				params = {
					itemKind = p4,
					categoryKey = p5,
					title = p6,
					folderId = p7
				}
			}))
		end
	end, { var42, var9, var18.routeName })
	local var46 = reactModule.useCallback(function(p4, p5)
		-- upvalues: var28 (ref), library (ref), sendBuildExperienceEventModule (copy), var9 (ref), var6 (ref), var18 (ref), roactNavigationModule (copy)
		local current = var28.current
		
		if current ~= nil then
			local item = library.getItem(false, p4)
			sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var9(), {
				action = "detail",
				kind = p5,
				surface = if var6.getIsOpen(false) then var18.routeName else "World",
				location = if item ~= nil then nil else item.rootName
			})
			current(roactNavigationModule.Actions.navigate({
				routeName = "Detail",
				key = "LibraryDetail",
				params = { itemId = p4, itemKind = p5 }
			}))
		end
	end, { var9, var18.routeName, var6, library })
	local var47 = reactModule.useRef(false)
	local var48 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var47 (ref), var23 (ref), var13 (ref), var27 (ref), var40 (ref), fFlagBuildExperienceLibrary (copy), var26 (ref), requestWorldFocus (copy), var25 (ref), var6 (ref), var24 (ref), var48 (ref)
		if var47.current or var23 == nil then return end
		if not var13 or var27.phase ~= "Home" then
			var47.current = true
			
			return
		elseif not var40 or not var27.isMeasured then return end
		if fFlagBuildExperienceLibrary then
			if var26 then
				var47.current = true
				requestWorldFocus(var25, var6)
			end
			return
		else
			for i, v in var24 do
				local model = v.model
				
				if v.folderId == nil and v.className ~= "Folder" and (model ~= nil and model:IsDescendantOf(var23)) then
					var47.current = true
					var48.current = model
					local var49 = var6
					local boundingBox, boundingBox_1 = model:GetBoundingBox()
					var49.requestFocus(boundingBox.Position, boundingBox_1.Magnitude / 2, model)
					
					return
				end
			end
		end
	end, {
		var24, var40, var13, var27.phase, var27.isMeasured, var23, var6, var26, var25
	})
	local var50 = var13 and var18.routeName == "Browser"
	local var51 = reactModule.useRef(var50)
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceLibrary (copy), var50 (ref), var51 (ref), var47 (ref), var26 (ref), requestWorldFocus (copy), var25 (ref), var6 (ref), var48 (ref), var23 (ref)
		if fFlagBuildExperienceLibrary then
			if var50 and not var51.current and (var47.current and var26) then
				requestWorldFocus(var25, var6)
			end
			var51.current = var50
			
			return
		else
			local current = var48.current
			local focusRequest = var6.getFocusRequest(false)
			
			if var50 and not var51.current and (current ~= nil and var23 ~= nil) and (current:IsDescendantOf(var23) and (focusRequest == nil or focusRequest.model ~= current)) then
				local var52 = var6
				local boundingBox, boundingBox_1 = current:GetBoundingBox()
				var52.requestFocus(boundingBox.Position, boundingBox_1.Magnitude / 2, current)
			end
			var51.current = var50
		end
	end, {
		var50,
		var23,
		var6,
		var26,
		var25
	})
	local browser = reactModule.useRef("Browser")
	browser.current = if var13 then var18.routeName else "World"
	local var52 = reactModule.useRef(false)
	local var53 = reactModule.useCallback(function(p4)
		-- upvalues: var52 (ref), sendBuildExperienceEventModule (copy), var9 (ref), browser (ref)
		if var52.current then
			return
		end
		var52.current = true
		sendBuildExperienceEventModule("LIBRARY_IMPRESSION", var9(), {
			phase = "closed",
			reason = p4,
			surface = browser.current
		})
	end, { var9 })
	local var54 = reactModule.useRef(var53)
	var54.current = var53
	reactModule.useEffect(function()
		-- upvalues: var54 (ref)
		return function()
			-- upvalues: var54 (copy)
			var54.current("other")
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var1 (copy)
		game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
		
		return function()
			-- upvalues: p3 (copy), var1 (copy)
			p3.onUnmount()
			
			if var1 ~= nil then
				var1:Destroy()
				var1 = nil
			end
		end
	end, { p3.onUnmount })
	local var55, var56 = reactModule.useState(false)
	local var57 = reactModule.useRef(false)
	local var58, var59 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: runService (copy), var59 (ref)
		local renderSteppedConnection = runService.RenderStepped:Once(function()
			-- upvalues: var59 (copy)
			var59(true)
		end)
		
		return function()
			-- upvalues: renderSteppedConnection (ref)
			renderSteppedConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var50 (ref), var1 (copy)
		if var50 and var1 ~= nil then
			var1:Destroy()
			var1 = nil
		end
	end, { var50 })
	local var60 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: var43 (ref), var60 (ref), var6 (ref), var10 (ref), var11 (ref), var17 (ref), libraryTypesModule (copy), var1 (copy), var42 (ref)
		if var43 == nil or var43.model == nil then
			return
		end
		local var61 = true
		local destroyingConnection = var43.model.Destroying:Connect(function()
			-- upvalues: var60 (copy), var6 (copy), var10 (copy), var11 (copy), var17 (copy), libraryTypesModule (copy), var43 (copy), var1 (copy), var61 (write), var42 (copy)
			var60.current += 1
			var6.clearFocus()
			var10.current = nil
			var11.current = nil
			var17.onRemoveResource(libraryTypesModule.toChatResource(var43))
			
			if var1 ~= nil then
				var1:Destroy()
				var1 = nil
			end
			task.defer(function()
				-- upvalues: var61 (copy), var42 (copy)
				if var61 then
					var42()
				end
			end)
		end)
		
		return function()
			-- upvalues: var61 (write), destroyingConnection (ref)
			var61 = false
			destroyingConnection:Disconnect()
		end
	end, { var43 or false, var6, var17, var42 })
	local var61 = signalsReactModule.useSignalState(getPlayButtonStoreModule().getIsActive)
	local var62 = var14 ~= nil and var14.isAssistantResponding == true
	local var63 = reactModule.useRef(false)
	local var64 = reactModule.useRef(nil)
	local var65 = signalsReactModule.useSignalState(var6.getPromptFailure)
	local var66 = reactModule.useRef(if var65 ~= nil then 0 else var65.token)
	reactModule.useEffect(function()
		-- upvalues: var65 (ref), var66 (ref), var64 (ref), sendBuildExperienceEventModule (copy), var9 (ref)
		if var65 == nil or var65.token <= var66.current then return end
		var66.current = var65.token
		local current = var64.current
		
		if current == nil then return end
		var64.current = nil
		local cloned = table.clone(current)
		cloned.phase = "failed"
		
		if var65.errorCode ~= nil then
			cloned.errorCode = tostring(var65.errorCode)
		end
		sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var9(), cloned)
	end, { var65, var9 })
	reactModule.useEffect(function()
		-- upvalues: var63 (ref), var62 (ref), var64 (ref), var40 (ref), var13 (ref), var42 (ref)
		if var63.current and not var62 then
			var64.current = nil
		end
		if var63.current and not var62 and (var40 and var13) then
			var42()
		end
		var63.current = var62
	end, { var62, var40, var13, var42 })
	local var67 = reactModule.useCallback(function(p4, p5)
		-- upvalues: focusModel (copy), var6 (ref), var60 (ref), libraryTypesModule (copy), var10 (ref), var11 (ref), getPlayButtonStoreModule (copy)
		if p4.model ~= nil and not p4.model:IsDescendantOf(workspace) then return end
		if p4.model ~= nil then
			focusModel(p4.model, var6)
		end
		var6.setIsOpen(false)
		var60.current += 1
		local current = var60.current
		task.defer(function()
			-- upvalues: var60 (copy), current (ref), var6 (copy), libraryTypesModule (copy), p4 (ref), var10 (copy), p5 (ref), var11 (copy), getPlayButtonStoreModule (copy)
			if var60.current == current and not var6.getIsOpen(false) then
				local var68 = libraryTypesModule.toChatResource(p4)
				var6.requestAddToChat(var68, var10.current, p5)
				var10.current = var68.path
				var11.current = var68
				getPlayButtonStoreModule().setIsActive(true)
				
				return
			end
		end)
	end, { var6 })
	reactModule.useEffect(function()
		-- upvalues: var60 (ref)
		return function()
			-- upvalues: var60 (copy)
			var60.current += 1
		end
	end, {})
	local var68 = signalsReactModule.useSignalState(var6.getChipEvent)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var68 (ref), libraryTypesModule (copy), var10 (ref), var1 (copy), library (ref), focusModel (copy), var6 (ref)
		local current = var11.current
		
		if var68 == nil or current == nil then return end
		if not table.find(var68.uris, libraryTypesModule.toResourceUri(current.path)) then return end
		if var68.kind == "Removed" then
			var10.current = nil
			var11.current = nil
			
			if var1 == nil then
				return
			else
				var1:Destroy()
				var1 = nil
				
				return
			end
		elseif var68.kind == "Activated" then
			for i, v in library.getItems(false) do
				if v.path == current.path and v.model ~= nil and v.model:IsDescendantOf(workspace) then
					focusModel(v.model, var6)
				end
			end
			return
		else
			var6.requestAddToChat(current, nil, false)
		end
	end, { var68, var6, library.getItems })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var40 (ref), var26 (ref), p3 (ref), createViewerWorldPickerModule (copy), var6 (ref), library (ref), var42 (ref), var46 (ref), var67 (ref), getPlayButtonStoreModule (copy), var11 (ref), var10 (ref), var17 (ref), var1 (copy)
		if var13 or not var40 or not var26 then
			return nil
		end
		local workspaceService = p3.dataModel:GetService("Workspace")
		local currentCamera = workspaceService.CurrentCamera
		
		if currentCamera == nil then
			return nil
		end
		local var69 = true
		local var70 = createViewerWorldPickerModule({
			camera = currentCamera,
			userInputService = p3.dataModel:GetService("UserInputService"),
			world = workspaceService,
			isBlocked = function()
				-- upvalues: var69 (write), var6 (copy)
				return not var69 or var6.getIsOpen(false)
			end,
			onPick = function(p4)
				-- upvalues: library (copy), var42 (copy), var46 (copy), var67 (copy), getPlayButtonStoreModule (copy)
				local var71 = library.resolveWorldItem(p4)
				
				if var71 == nil then
					var42()
					var71 = library.resolveWorldItem(p4)
				end
				if var71 ~= nil then
					var46(var71.id, var71.kind)
					var67(var71, not getPlayButtonStoreModule().getIsActive(false))
				end
			end,
			onMiss = function()
				-- upvalues: var11 (copy), var10 (copy), var17 (copy), var1 (copy)
				local current = var11.current
				
				if current == nil then return end
				var10.current = nil
				var11.current = nil
				var17.onRemoveResource(current)
				
				if var1 ~= nil then
					var1:Destroy()
					var1 = nil
				end
			end
		})
		
		return function()
			-- upvalues: var69 (write), var70 (ref)
			var69 = false
			var70()
		end
	end, {
		var13, var40, var26, var6, library, var42, var67, var46, var17, p3.dataModel
	})
	
	local var69 = function()
		-- upvalues: var40 (ref), var42 (ref), var6 (ref), sendBuildExperienceEventModule (copy), var9 (ref), var27 (ref), var21 (ref), var60 (ref), getPlayButtonStoreModule (copy)
		if var40 then
			var42()
		end
		if not var6.getIsOpen(false) then
			sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var9(), if var27.exit() then {
				action = "back",
				kind = "All",
				surface = "World",
				source = "home_cutout"
			} else { action = "object", surface = "World", kind = var21 })
		end
		var60.current += 1
		getPlayButtonStoreModule().setIsActive(false)
		var6.setIsOpen(true)
	end
	
	local var70 = reactModule.useCallback(function(p4)
		-- upvalues: var6 (ref)
		var6.setWorldViewportRect(if p4 ~= nil then nil else Rect.new(p4.AbsolutePosition, p4.AbsolutePosition + p4.AbsoluteSize))
	end, { var6 })
	
	local var71 = function(p4)
		-- upvalues: var20 (ref), library (ref), var6 (ref), var67 (ref), sendBuildExperienceEventModule (copy), var9 (ref)
		if var20 ~= nil then
			local item = library.getItem(false, var20)
			
			if item == nil then
				var6.setIsOpen(false)
				
				return
			end
			local isOpen = var6.getIsOpen(false)
			var67(item, p4 ~= "prompt")
			local var72 = isOpen and not var6.getIsOpen(false)
			
			if var72 or isOpen and item.model ~= nil and not item.model:IsDescendantOf(workspace) then
				sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var9(), {
					action = "world",
					surface = "Detail",
					outcome = if var72 then nil else "unavailable",
					kind = item.kind,
					source = p4 or "segmented_control",
					location = item.rootName
				})
			end
		end
	end
	
	local var72 = function()
		-- upvalues: var18 (ref), var6 (ref), var27 (ref), sendBuildExperienceEventModule (copy), var9 (ref), fFlagBuildExperienceLibrary (copy), requestWorldFocus (copy), var25 (ref), var71 (ref)
		if var18.routeName ~= "Browser" or not var6.getIsOpen(false) or not var27.enter() then return end
		sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var9(), {
			action = "world",
			kind = "All",
			surface = "Home",
			source = "home_cutout"
		})
		
		if fFlagBuildExperienceLibrary then
			requestWorldFocus(var25, var6)
		end
		var71()
	end
	
	local function returnToAppChat(p4, p5)
		-- upvalues: var57 (ref), var56 (ref), var53 (ref), p3 (ref), httpService (copy), leaveExperienceModule (copy), default (copy)
		if var57.current then return end
		var57.current = true
		var56(true)
		var53(p5)
		p4 = p4 or p3.sessionId
		local gameId = `roblox://navigation/build?universeid={p3.dataModel.GameId}`
		
		if p4 ~= nil then
			gameId ..= `&sessionid={httpService:UrlEncode(p4)}`
		end
		task.spawn(leaveExperienceModule, function()
			-- upvalues: default (copy), gameId (write)
			default:detectURL(gameId)
		end)
	end
	
	local function onNavigateBack()
		-- upvalues: var57 (ref), var13 (ref), var69 (ref), var18 (ref), returnToAppChat (ref), var44 (ref)
		if var57.current then return end
		if not var13 then
			var69()
			
			return
		elseif var18.routeName == "Browser" then
			returnToAppChat(nil, "back_button")
			
			return
		end
		var44()
	end
	
	local var73 = reactModule.useRef(onNavigateBack)
	var73.current = onNavigateBack
	local var74 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var73 (ref), getAndroidBackSignalModule (copy), bindLibraryBackInputModule (copy), var74 (ref)
		local function navigateBack()
			-- upvalues: var73 (copy)
			var73.current()
		end
		
		local var75 = getAndroidBackSignalModule():Connect(navigateBack)
		local var76 = bindLibraryBackInputModule(navigateBack)
		var74.current = var76
		
		return function()
			-- upvalues: var75 (ref), var76 (ref), var74 (copy)
			var75:Disconnect()
			var76.unbind()
			var74.current = nil
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var74 (ref), var61 (ref)
		if var74.current ~= nil then
			var74.current.setChatOpen(var61)
		end
	end, { var61 })
	local var75 = if var14 ~= nil then nil else table.clone(var14)
	
	if var75 ~= nil and var14 ~= nil then
		local onSend = var14.onSend
		
		function var118.onSend()
			-- upvalues: var21 (ref), var43 (ref), sendBuildExperienceEventModule (copy), var9 (ref), onSend (ref), returnToAppChat (ref), var64 (ref), var71 (ref)
			local t = {
				action = "prompt",
				surface = "Detail",
				kind = var21,
				location = if var43 ~= nil then nil else var43.rootName
			}
			local _ = nil
			local var76 = if var21 == "Image" or var21 == "Sound" then onSend(function(p4)
				-- upvalues: t (ref), sendBuildExperienceEventModule (copy), var9 (copy), returnToAppChat (copy)
				local cloned = table.clone(t)
				cloned.phase = "received"
				sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var9(), cloned)
				returnToAppChat(p4, "prompt_return")
			end) else onSend(function()
				-- upvalues: t (ref), sendBuildExperienceEventModule (copy), var9 (copy)
				local cloned = table.clone(t)
				cloned.phase = "received"
				sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var9(), cloned)
			end)
			
			if var76 then
				var64.current = t
			end
			if var76 and var21 == "Model" then
				var71("prompt")
			end
			local cloned = table.clone(t)
			cloned.phase = "submit"
			cloned.outcome = if var76 then "accepted" else "rejected"
			sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var9(), cloned)
			
			return var76
		end
	end
	local createElement = reactModule.createElement
	createElement = createElement(libraryNavigatorModule, {
		externalDispatchConnector = var29,
		onNavigationStateChange = var30,
		screenProps = {
			library = library,
			isReady = var40,
			isOpen = var13,
			activeRouteKey = var18.key,
			query = var31,
			onBack = var44,
			onOpenItem = var46,
			onOpenCategory = var45,
			chatActions = var75,
			resourceActions = var17,
			unavailableText = var12.modelUnavailable,
			worldCutout = if var26 or fFlagBuildExperienceLibrary and not var40 then {
				title = var12.world,
				onActivated = var72,
				onRectChanged = var27.onCellRectChanged
			} else nil
		}
	})
	local var76 = if var20 == nil then var12.title elseif var21 == "Model" then var12.object elseif var21 == "Image" then var12.image else var12.sound
	
	return reactModule.createElement(focusNavigationUtilsModule.FocusRoot, {
		isIsolated = true,
		surfaceIdentifier = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
		isAutoFocusRoot = var13,
		isFocusable = var13
	}, {
		Experience = reactModule.createElement(libraryExperienceViewModule, {
			isOpen = var13,
			showModeControl = var26 and (var20 ~= nil and var21 == "Model"),
			isWorldAvailable = if var43 == nil or var43.model == nil then nil else var43.model:IsDescendantOf(workspace),
			title = if var20 ~= nil then if var27.phase == "Expanding" or var27.phase == "World" then var12.world elseif var22 ~= nil then var12.title else var22.title elseif var43 ~= nil then var76 else var43.displayName,
			onBack = if var20 == nil and var22 == nil and var18.routeName ~= "Search" then if not var13 then var69 else nil else var44,
			query = if var20 == nil then var31 else nil,
			searchPlaceholder = var12.searchPlaceholder,
			onQueryChanged = if var20 == nil then var34 else nil,
			onSearchReset = if var20 == nil then var39 else nil,
			assetLabel = var76,
			worldLabel = var12.world,
			onShowLibrary = var69,
			onShowWorld = var71,
			onWorldViewportChanged = var70,
			worldCutout = var27.view,
			onLeave = function()
				-- upvalues: returnToAppChat (ref)
				returnToAppChat(nil, "close_button")
			end
		}, createElement),
		Leaving = if var55 then reactModule.createElement(libraryLeavingOverlayModule, { ZIndex = 2 }) else nil,
		FirstFrameCover = if not var58 then reactModule.createElement(foundationModule.View, {
			ZIndex = 3,
			tag = "size-full bg-surface-0",
			testId = "Library.FirstFrameCover"
		}) else nil
	})
end

return function(p4, p5)
	-- upvalues: var2 (write), getLibraryStoreModule (ref), coreGuiService (ref), createBuildLibraryStoreModule (ref), reactRobloxModule (ref), localization (ref), localizationService (ref), reactFocusNavigationModule (ref), reactModule (ref), localizationProvider (ref), libraryThemeProviderModule (ref), buildExperienceCompositionStyleSheetModule (ref), focusNavigationUtilsModule (ref), ConnectedLibrary (ref)
	if var2 == nil then
		getLibraryStoreModule().setIsOpen(true)
		local buildExperienceLibrary = Instance.new("ScreenGui")
		buildExperienceLibrary.Name = "BuildExperienceLibrary"
		buildExperienceLibrary.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
		buildExperienceLibrary.ClipToDeviceSafeArea = false
		buildExperienceLibrary.ResetOnSpawn = false
		buildExperienceLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		buildExperienceLibrary.DisplayOrder = 10
		buildExperienceLibrary.Parent = coreGuiService
		local var69 = createBuildLibraryStoreModule(p4 or game)
		local var70 = reactRobloxModule.createRoot(buildExperienceLibrary)
		var2 = var70
		local var71 = localization.new(localizationService.RobloxLocaleId)
		local var72 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
		reactRobloxModule.flushSync(function()
			-- upvalues: var70 (ref), reactModule (copy), localizationProvider (copy), var71 (ref), libraryThemeProviderModule (copy), buildExperienceCompositionStyleSheetModule (copy), reactFocusNavigationModule (copy), var72 (ref), focusNavigationUtilsModule (copy), ConnectedLibrary (copy), p4 (ref), var69 (ref), p5 (ref), var2 (copy), buildExperienceLibrary (ref)
			var70:render(reactModule.createElement(localizationProvider, { localization = var71 }, {
				FoundationProvider = reactModule.createElement(libraryThemeProviderModule, { displayOrder = 10 }, {
					CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
					Library = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var72 }, {
						Registry = reactModule.createElement(focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider, nil, {
							Content = reactModule.createElement(ConnectedLibrary, {
								dataModel = p4 or game,
								library = var69,
								sessionId = p5,
								onUnmount = function()
									-- upvalues: var72 (copy), var2 (copy), buildExperienceLibrary (copy)
									var72:teardown()
									var2 = nil
									buildExperienceLibrary:Destroy()
								end
							})
						})
					})
				})
			}))
		end)
		
		return var70
	end
	return var2
end