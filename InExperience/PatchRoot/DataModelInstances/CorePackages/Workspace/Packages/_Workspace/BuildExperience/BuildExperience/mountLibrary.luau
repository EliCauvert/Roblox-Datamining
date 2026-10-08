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

local _ = function(p1)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1:GetService("Workspace")
	end)
	
	return if ok and typeof(status) == "Instance" and status:IsA("Workspace") then status else nil
end

local function ConnectedLibrary(p1)
	-- upvalues: getLibraryStoreModule (ref), reactModule (ref), useLibraryStringsModule (ref), signalsReactModule (ref), useLibraryWorldCutoutViewModelModule (ref), sendBuildExperienceEventModule (ref), roactNavigationModule (ref), signalsModule (ref), getPlayButtonStoreModule (ref), var1 (write), runService (ref), libraryTypesModule (ref), focusModel (ref), createViewerWorldPickerModule (ref), httpService (ref), leaveExperienceModule (ref), default (ref), getAndroidBackSignalModule (ref), bindLibraryBackInputModule (ref), libraryNavigatorModule (ref), focusNavigationUtilsModule (ref), libraryExperienceViewModule (ref), libraryLeavingOverlayModule (ref), foundationModule (ref)
	local var3 = getLibraryStoreModule()
	local var4 = reactModule.useRef(os.clock())
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		return {
			universeId = p1.dataModel.GameId,
			placeId = p1.dataModel.PlaceId
		}
	end, { p1.dataModel })
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = useLibraryStringsModule()
	local var10 = var3.useIsOpen()
	local var11 = signalsReactModule.useSignalState(var3.getChatComposerState)
	local var12 = if var11 ~= nil then nil else var11.onAddResource
	local var13 = if var11 ~= nil then nil else var11.onRemoveResourceByPath
	local var14 = reactModule.useMemo(function()
		-- upvalues: var12 (ref), var13 (ref), var7 (ref), var8 (ref), var3 (ref)
		return if var12 == nil or var13 == nil then {
			onAddResource = function(p2)
				-- upvalues: var3 (copy)
				var3.requestAddToChat(p2)
				
				return true
			end,
			onRemoveResource = var3.requestRemoveFromChat
		} else {
			onAddResource = function(p2)
				-- upvalues: var7 (copy), var8 (copy), var13 (copy), var12 (copy)
				local current = var7.current
				
				if current ~= nil and current ~= p2.path then
					var7.current = nil
					var8.current = nil
					var13(current)
				end
				return var12(p2)
			end,
			onRemoveResource = function(p2)
				-- upvalues: var13 (copy)
				var13(p2.path)
			end
		}
	end, { var12 or false, var13 or false, var3 })
	local var15, var16 = reactModule.useState({ routeName = "Browser" })
	local var17 = if var15.routeName == "Detail" then var15.params.itemId else nil
	local var18 = if var17 ~= nil then "Model" else var15.params.itemKind
	local var19 = if var15.routeName == "Category" or var15.routeName == "Search" and var15.params.itemKind ~= nil then var15.params else nil
	local var20 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		local dataModel = p1.dataModel
		local ok, status = pcall(function()
			-- upvalues: dataModel (ref)
			return dataModel:GetService("Workspace")
		end)
		
		return if ok and typeof(status) == "Instance" and status:IsA("Workspace") then status else nil
	end, { p1.dataModel })
	local var21 = useLibraryWorldCutoutViewModelModule({
		isAvailable = var20 ~= nil,
		isHome = var15.routeName == "Browser",
		isOpen = var10,
		onViewportRectChanged = var3.setWorldViewportRect
	})
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), p1 (ref), sendBuildExperienceEventModule (copy), var6 (ref), var10 (ref), var15 (ref), var18 (ref), var19 (ref)
		local var22 = if var17 ~= nil then nil else p1.library.getItem(false, var17)
		sendBuildExperienceEventModule("LIBRARY_IMPRESSION", var6(), {
			phase = "viewed",
			surface = if var10 then var15.routeName else "World",
			kind = if var17 ~= nil then if var19 ~= nil then "All" else var19.itemKind else var18,
			scope = if var19 == nil or var19.folderId == nil then "Root" else "Folder",
			hasDescription = if var22 ~= nil then nil else tostring(var22.description ~= nil),
			location = if var22 ~= nil then nil else var22.rootName
		})
	end, {
		p1.library, var6, var10, var15.routeName, var17 or false, var18,
		if var19 ~= nil then false else var19.folderId or var19.itemKind
	})
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: var22 (ref)
		var22.current = p2
		
		return function()
			-- upvalues: var22 (copy)
			var22.current = nil
		end
	end, {})
	local var24 = reactModule.useCallback(function(_, p2)
		-- upvalues: var16 (ref)
		var16(p2.routes[p2.index])
	end, {})
	local var25, var26 = reactModule.useState("")
	local var27 = reactModule.useRef(nil)
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var26 (ref), var22 (ref), var15 (ref), roactNavigationModule (copy), var19 (ref), var27 (ref), sendBuildExperienceEventModule (copy), var6 (ref)
		var26(p2)
		local current = var22.current
		
		if current ~= nil then
			local reducedMotion = UserSettings():GetService("UserGameSettings").ReducedMotion
			
			if p2 ~= "" and var15.routeName ~= "Search" then
				current(roactNavigationModule.Actions.navigate({
					routeName = "Search",
					key = "LibrarySearch",
					params = var19 or {},
					immediate = reducedMotion
				}))
			elseif p2 == "" and var15.routeName == "Search" then
				current(roactNavigationModule.StackActions.pop({ immediate = reducedMotion }))
			end
		end
		if var27.current ~= nil then
			task.cancel(var27.current)
		end
		var27.current = task.delay(0.3, function()
			-- upvalues: var27 (copy), sendBuildExperienceEventModule (copy), var6 (copy), var19 (copy), p2 (ref)
			var27.current = nil
			sendBuildExperienceEventModule("LIBRARY_SEARCH", var6(), {
				surface = if var19 ~= nil then "Browser" else "Category",
				kind = if var19 ~= nil then "All" else var19.itemKind,
				scope = if var19 == nil or var19.folderId == nil then "Root" else "Folder",
				hasQuery = tostring(p2 ~= "")
			})
		end)
	end, { var6, var15, var19 or false })
	local useEffect = reactModule.useEffect
	
	local var29 = function()
		-- upvalues: var27 (ref)
		return function()
			-- upvalues: var27 (copy)
			if var27.current ~= nil then
				task.cancel(var27.current)
				var27.current = nil
			end
		end
	end
	
	local t = {}
	local var30 = var17 or false
	local var31 = if var19 ~= nil then false else var19.itemKind
	local var32 = var19 == nil and ((if var19 == nil then var19.folderId else nil) or false)
	-- Unknown statement at pc 0: <SetList>
	useEffect(var29, t)
	local var33 = reactModule.useCallback(function()
		-- upvalues: var28 (ref)
		var28("")
	end, { var28 })
	local library = p1.library
	local var34, var35 = reactModule.useState(false)
	local var36 = reactModule.useCallback(function()
		-- upvalues: library (ref), sendBuildExperienceEventModule (copy), var6 (ref), var5 (ref)
		local ok, status = pcall(function()
			-- upvalues: library (copy)
			library.refresh()
			
			return nil
		end)
		
		if not ok then
			sendBuildExperienceEventModule("LIBRARY_FETCH_FAILED", var6(), {
				surface = "Library",
				reason = "refresh_failed",
				phase = if var5.current then "refresh" else "initial"
			})
			error(status, 0)
		end
	end, { library, var6 })
	reactModule.useEffect(function()
		-- upvalues: sendBuildExperienceEventModule (copy), var6 (ref), p1 (ref), var36 (ref), var35 (ref), var5 (ref), library (ref), var4 (ref)
		sendBuildExperienceEventModule("LIBRARY_IMPRESSION", var6(), { phase = "opened", surface = "Library" })
		local dataModel = p1.dataModel
		
		local function ready()
			-- upvalues: var36 (copy), var35 (copy), var5 (copy), library (copy), sendBuildExperienceEventModule (copy), var6 (copy), var4 (copy)
			var36()
			var35(true)
			
			if not var5.current then
				var5.current = true
				local t = { Model = 0, Image = 0, Sound = 0, Folder = 0 }
				
				for i, v in library.getItems(false) do
					t[if v.className == "Folder" then "Folder" else v.kind] += 1
				end
				sendBuildExperienceEventModule("LIBRARY_IMPRESSION", var6(), {
					phase = "ready",
					surface = "Library",
					durationMs = tostring(math.round((os.clock() - var4.current) * 1000)),
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
	end, { library, p1.dataModel, var36, var6 })
	local var37 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var17 (ref), library (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var17 (copy), library (copy)
			return if var17 == nil then nil else library.getItem(p2, var17)
		end)
	end, { library, var17 or false }))
	local var38 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var15 (ref), var26 (ref), var36 (ref), var3 (ref), getPlayButtonStoreModule (copy), roactNavigationModule (copy)
		local current = var22.current
		
		if var15.routeName == "Browser" or current == nil then
			var3.setIsOpen(false)
			
			return
		elseif var15.routeName == "Search" then
			var26("")
		else
			var36()
		end
		var3.setIsOpen(true)
		getPlayButtonStoreModule().setIsActive(false)
		current(roactNavigationModule.StackActions.pop({
			immediate = var15.routeName == "Search" and UserSettings():GetService("UserGameSettings").ReducedMotion
		}))
	end, { var15.routeName, var3, var36 })
	local var39 = reactModule.useCallback(function(p2, p3, p4, p5)
		-- upvalues: var36 (ref), var26 (ref), var22 (ref), sendBuildExperienceEventModule (copy), var6 (ref), var15 (ref), roactNavigationModule (copy)
		var36()
		
		if p5 ~= nil then
			var26("")
		end
		local current = var22.current
		
		if current ~= nil then
			sendBuildExperienceEventModule("LIBRARY_CATEGORY_CLICK", var6(), {
				action = if p5 ~= nil then "category" else "folder",
				kind = p2,
				surface = var15.routeName
			})
			current(roactNavigationModule.Actions.navigate({
				routeName = "Category",
				key = if p5 ~= nil then "LibraryCategory" else `LibraryFolder:{p5}`,
				params = {
					itemKind = p2,
					categoryKey = p3,
					title = p4,
					folderId = p5
				}
			}))
		end
	end, { var36, var6, var15.routeName })
	local var40 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var22 (ref), library (ref), sendBuildExperienceEventModule (copy), var6 (ref), var3 (ref), var15 (ref), roactNavigationModule (copy)
		local current = var22.current
		
		if current ~= nil then
			local item = library.getItem(false, p2)
			sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var6(), {
				action = "detail",
				kind = p3,
				surface = if var3.getIsOpen(false) then var15.routeName else "World",
				location = if item ~= nil then nil else item.rootName
			})
			current(roactNavigationModule.Actions.navigate({
				routeName = "Detail",
				key = "LibraryDetail",
				params = { itemId = p2, itemKind = p3 }
			}))
		end
	end, { var6, var15.routeName, var3, library })
	local var41 = signalsReactModule.useSignalState(library.getItems)
	local var42 = reactModule.useRef(false)
	local var43 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var42 (ref), var20 (ref), var10 (ref), var21 (ref), var34 (ref), var41 (ref), var43 (ref), var3 (ref)
		if var42.current or var20 == nil then return end
		if not var10 or var21.phase ~= "Home" then
			var42.current = true
			
			return
		elseif not var34 or not var21.isMeasured then return end
		for i, v in var41 do
			local model = v.model
			
			if v.folderId == nil and v.className ~= "Folder" and (model ~= nil and model:IsDescendantOf(var20)) then
				var42.current = true
				var43.current = model
				local var44 = var3
				local boundingBox, boundingBox_1 = model:GetBoundingBox()
				var44.requestFocus(boundingBox.Position, boundingBox_1.Magnitude / 2, model)
				
				return
			end
		end
	end, {
		var41, var34, var10, var21.phase, var21.isMeasured, var20, var3
	})
	local var45 = var10 and var15.routeName == "Browser"
	local var46 = reactModule.useRef(var45)
	reactModule.useEffect(function()
		-- upvalues: var43 (ref), var3 (ref), var45 (ref), var46 (ref), var20 (ref)
		local current = var43.current
		local focusRequest = var3.getFocusRequest(false)
		
		if var45 and not var46.current and (current ~= nil and var20 ~= nil) and (current:IsDescendantOf(var20) and (focusRequest == nil or focusRequest.model ~= current)) then
			local var47 = var3
			local boundingBox, boundingBox_1 = current:GetBoundingBox()
			var47.requestFocus(boundingBox.Position, boundingBox_1.Magnitude / 2, current)
		end
		var46.current = var45
	end, { var45, var20, var3 })
	local browser = reactModule.useRef("Browser")
	browser.current = if var10 then var15.routeName else "World"
	local var47 = reactModule.useRef(false)
	local var48 = reactModule.useCallback(function(p2)
		-- upvalues: var47 (ref), sendBuildExperienceEventModule (copy), var6 (ref), browser (ref)
		if var47.current then
			return
		end
		var47.current = true
		sendBuildExperienceEventModule("LIBRARY_IMPRESSION", var6(), {
			phase = "closed",
			reason = p2,
			surface = browser.current
		})
	end, { var6 })
	local var49 = reactModule.useRef(var48)
	var49.current = var48
	reactModule.useEffect(function()
		-- upvalues: var49 (ref)
		return function()
			-- upvalues: var49 (copy)
			var49.current("other")
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (copy)
		game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
		
		return function()
			-- upvalues: p1 (copy), var1 (copy)
			p1.onUnmount()
			
			if var1 ~= nil then
				var1:Destroy()
				var1 = nil
			end
		end
	end, { p1.onUnmount })
	local var50, var51 = reactModule.useState(false)
	local var52 = reactModule.useRef(false)
	local var53, var54 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: runService (copy), var54 (ref)
		local renderSteppedConnection = runService.RenderStepped:Once(function()
			-- upvalues: var54 (copy)
			var54(true)
		end)
		
		return function()
			-- upvalues: renderSteppedConnection (ref)
			renderSteppedConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var45 (ref), var1 (copy)
		if var45 and var1 ~= nil then
			var1:Destroy()
			var1 = nil
		end
	end, { var45 })
	local var55 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: var37 (ref), var55 (ref), var3 (ref), var7 (ref), var8 (ref), var14 (ref), libraryTypesModule (copy), var1 (copy), var36 (ref)
		if var37 == nil or var37.model == nil then
			return
		end
		local var56 = true
		local destroyingConnection = var37.model.Destroying:Connect(function()
			-- upvalues: var55 (copy), var3 (copy), var7 (copy), var8 (copy), var14 (copy), libraryTypesModule (copy), var37 (copy), var1 (copy), var56 (write), var36 (copy)
			var55.current += 1
			var3.clearFocus()
			var7.current = nil
			var8.current = nil
			var14.onRemoveResource(libraryTypesModule.toChatResource(var37))
			
			if var1 ~= nil then
				var1:Destroy()
				var1 = nil
			end
			task.defer(function()
				-- upvalues: var56 (copy), var36 (copy)
				if var56 then
					var36()
				end
			end)
		end)
		
		return function()
			-- upvalues: var56 (write), destroyingConnection (ref)
			var56 = false
			destroyingConnection:Disconnect()
		end
	end, { var37 or false, var3, var14, var36 })
	local var56 = signalsReactModule.useSignalState(getPlayButtonStoreModule().getIsActive)
	local var57 = var11 ~= nil and var11.isAssistantResponding == true
	local var58 = reactModule.useRef(false)
	local var59 = reactModule.useRef(nil)
	local var60 = signalsReactModule.useSignalState(var3.getPromptFailure)
	local var61 = reactModule.useRef(if var60 ~= nil then 0 else var60.token)
	reactModule.useEffect(function()
		-- upvalues: var60 (ref), var61 (ref), var59 (ref), sendBuildExperienceEventModule (copy), var6 (ref)
		if var60 == nil or var60.token <= var61.current then return end
		var61.current = var60.token
		local current = var59.current
		
		if current == nil then return end
		var59.current = nil
		local cloned = table.clone(current)
		cloned.phase = "failed"
		
		if var60.errorCode ~= nil then
			cloned.errorCode = tostring(var60.errorCode)
		end
		sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var6(), cloned)
	end, { var60, var6 })
	reactModule.useEffect(function()
		-- upvalues: var58 (ref), var57 (ref), var59 (ref), var34 (ref), var10 (ref), var36 (ref)
		if var58.current and not var57 then
			var59.current = nil
		end
		if var58.current and not var57 and (var34 and var10) then
			var36()
		end
		var58.current = var57
	end, { var57, var34, var10, var36 })
	local var62 = reactModule.useCallback(function(p2, p3)
		-- upvalues: focusModel (copy), var3 (ref), var55 (ref), libraryTypesModule (copy), var7 (ref), var8 (ref), getPlayButtonStoreModule (copy)
		if p2.model ~= nil and not p2.model:IsDescendantOf(workspace) then return end
		if p2.model ~= nil then
			focusModel(p2.model, var3)
		end
		var3.setIsOpen(false)
		var55.current += 1
		local current = var55.current
		task.defer(function()
			-- upvalues: var55 (copy), current (ref), var3 (copy), libraryTypesModule (copy), p2 (ref), var7 (copy), p3 (ref), var8 (copy), getPlayButtonStoreModule (copy)
			if var55.current == current and not var3.getIsOpen(false) then
				local var63 = libraryTypesModule.toChatResource(p2)
				var3.requestAddToChat(var63, var7.current, p3)
				var7.current = var63.path
				var8.current = var63
				getPlayButtonStoreModule().setIsActive(true)
				
				return
			end
		end)
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var55 (ref)
		return function()
			-- upvalues: var55 (copy)
			var55.current += 1
		end
	end, {})
	local var63 = signalsReactModule.useSignalState(var3.getChipEvent)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var63 (ref), libraryTypesModule (copy), var7 (ref), var1 (copy), var3 (ref)
		local current = var8.current
		
		if var63 == nil or current == nil then return end
		if not table.find(var63.uris, libraryTypesModule.toResourceUri(current.path)) then return end
		if var63.kind == "Removed" then
			var7.current = nil
			var8.current = nil
			
			if var1 == nil then
				return
			else
				var1:Destroy()
				var1 = nil
				
				return
			end
		else
			var3.requestAddToChat(current, nil, false)
		end
	end, { var63, var3 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var34 (ref), p1 (ref), createViewerWorldPickerModule (copy), var3 (ref), library (ref), var36 (ref), var40 (ref), var62 (ref), getPlayButtonStoreModule (copy), var8 (ref), var7 (ref), var14 (ref), var1 (copy)
		if var10 or not var34 then
			return nil
		end
		local workspaceService = p1.dataModel:GetService("Workspace")
		local currentCamera = workspaceService.CurrentCamera
		
		if currentCamera == nil then
			return nil
		end
		local var64 = true
		local var65 = createViewerWorldPickerModule({
			camera = currentCamera,
			userInputService = p1.dataModel:GetService("UserInputService"),
			world = workspaceService,
			isBlocked = function()
				-- upvalues: var64 (write), var3 (copy)
				return not var64 or var3.getIsOpen(false)
			end,
			onPick = function(p2)
				-- upvalues: library (copy), var36 (copy), var40 (copy), var62 (copy), getPlayButtonStoreModule (copy)
				local var66 = library.resolveWorldItem(p2)
				
				if var66 == nil then
					var36()
					var66 = library.resolveWorldItem(p2)
				end
				if var66 ~= nil then
					var40(var66.id, var66.kind)
					var62(var66, not getPlayButtonStoreModule().getIsActive(false))
				end
			end,
			onMiss = function()
				-- upvalues: var8 (copy), var7 (copy), var14 (copy), var1 (copy)
				local current = var8.current
				
				if current == nil then return end
				var7.current = nil
				var8.current = nil
				var14.onRemoveResource(current)
				
				if var1 ~= nil then
					var1:Destroy()
					var1 = nil
				end
			end
		})
		
		return function()
			-- upvalues: var64 (write), var65 (ref)
			var64 = false
			var65()
		end
	end, {
		var10, var34, var3, library, var36, var62, var40, var14, p1.dataModel
	})
	
	local var64 = function()
		-- upvalues: var34 (ref), var36 (ref), var3 (ref), sendBuildExperienceEventModule (copy), var6 (ref), var21 (ref), var18 (ref), var55 (ref), getPlayButtonStoreModule (copy)
		if var34 then
			var36()
		end
		if not var3.getIsOpen(false) then
			sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var6(), if var21.exit() then {
				action = "back",
				kind = "All",
				surface = "World",
				source = "home_cutout"
			} else { action = "object", surface = "World", kind = var18 })
		end
		var55.current += 1
		getPlayButtonStoreModule().setIsActive(false)
		var3.setIsOpen(true)
	end
	
	local var65 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3.setWorldViewportRect(if p2 ~= nil then nil else Rect.new(p2.AbsolutePosition, p2.AbsolutePosition + p2.AbsoluteSize))
	end, { var3 })
	
	local var66 = function(p2)
		-- upvalues: var17 (ref), library (ref), var3 (ref), var62 (ref), sendBuildExperienceEventModule (copy), var6 (ref)
		if var17 ~= nil then
			local item = library.getItem(false, var17)
			
			if item == nil then
				var3.setIsOpen(false)
				
				return
			end
			local isOpen = var3.getIsOpen(false)
			var62(item, p2 ~= "prompt")
			local var67 = isOpen and not var3.getIsOpen(false)
			
			if var67 or isOpen and item.model ~= nil and not item.model:IsDescendantOf(workspace) then
				sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var6(), {
					action = "world",
					surface = "Detail",
					outcome = if var67 then nil else "unavailable",
					kind = item.kind,
					source = p2 or "segmented_control",
					location = item.rootName
				})
			end
		end
	end
	
	local var67 = function()
		-- upvalues: var15 (ref), var3 (ref), var21 (ref), sendBuildExperienceEventModule (copy), var6 (ref), var66 (ref)
		if var15.routeName == "Browser" and var3.getIsOpen(false) and var21.enter() then
			sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var6(), {
				action = "world",
				kind = "All",
				surface = "Home",
				source = "home_cutout"
			})
			var66()
			
			return
		end
	end
	
	local function returnToAppChat(p2, p3)
		-- upvalues: var52 (ref), var51 (ref), var48 (ref), p1 (ref), httpService (copy), leaveExperienceModule (copy), default (copy)
		if var52.current then return end
		var52.current = true
		var51(true)
		var48(p3)
		p2 = p2 or p1.sessionId
		local gameId = `roblox://navigation/build?universeid={p1.dataModel.GameId}`
		
		if p2 ~= nil then
			gameId ..= `&sessionid={httpService:UrlEncode(p2)}`
		end
		task.spawn(leaveExperienceModule, function()
			-- upvalues: default (copy), gameId (write)
			default:detectURL(gameId)
		end)
	end
	
	local function onNavigateBack()
		-- upvalues: var52 (ref), var10 (ref), var64 (ref), var15 (ref), returnToAppChat (ref), var38 (ref)
		if var52.current then return end
		if not var10 then
			var64()
			
			return
		elseif var15.routeName == "Browser" then
			returnToAppChat(nil, "back_button")
			
			return
		end
		var38()
	end
	
	local var68 = reactModule.useRef(onNavigateBack)
	var68.current = onNavigateBack
	local var69 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var68 (ref), getAndroidBackSignalModule (copy), bindLibraryBackInputModule (copy), var69 (ref)
		local function navigateBack()
			-- upvalues: var68 (copy)
			var68.current()
		end
		
		local var70 = getAndroidBackSignalModule():Connect(navigateBack)
		local var71 = bindLibraryBackInputModule(navigateBack)
		var69.current = var71
		
		return function()
			-- upvalues: var70 (ref), var71 (ref), var69 (copy)
			var70:Disconnect()
			var71.unbind()
			var69.current = nil
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var69 (ref), var56 (ref)
		if var69.current ~= nil then
			var69.current.setChatOpen(var56)
		end
	end, { var56 })
	local var70 = if var11 ~= nil then nil else table.clone(var11)
	
	if var70 ~= nil and var11 ~= nil then
		local onSend = var11.onSend
		
		function var110.onSend()
			-- upvalues: var18 (ref), var37 (ref), sendBuildExperienceEventModule (copy), var6 (ref), onSend (ref), returnToAppChat (ref), var59 (ref), var66 (ref)
			local t = {
				action = "prompt",
				surface = "Detail",
				kind = var18,
				location = if var37 ~= nil then nil else var37.rootName
			}
			local _ = nil
			local var71 = if var18 == "Image" or var18 == "Sound" then onSend(function(p2)
				-- upvalues: t (ref), sendBuildExperienceEventModule (copy), var6 (copy), returnToAppChat (copy)
				local cloned = table.clone(t)
				cloned.phase = "received"
				sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var6(), cloned)
				returnToAppChat(p2, "prompt_return")
			end) else onSend(function()
				-- upvalues: t (ref), sendBuildExperienceEventModule (copy), var6 (copy)
				local cloned = table.clone(t)
				cloned.phase = "received"
				sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var6(), cloned)
			end)
			
			if var71 then
				var59.current = t
			end
			if var71 and var18 == "Model" then
				var66("prompt")
			end
			local cloned = table.clone(t)
			cloned.phase = "submit"
			cloned.outcome = if var71 then "accepted" else "rejected"
			sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", var6(), cloned)
			
			return var71
		end
	end
	local var71 = if var17 == nil then var9.title elseif var18 == "Model" then var9.object elseif var18 == "Image" then var9.image else var9.sound
	
	return reactModule.createElement(focusNavigationUtilsModule.FocusRoot, {
		isIsolated = true,
		surfaceIdentifier = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
		isAutoFocusRoot = var10,
		isFocusable = var10
	}, {
		Experience = reactModule.createElement(libraryExperienceViewModule, {
			isOpen = var10,
			showModeControl = var17 ~= nil and var18 == "Model",
			isWorldAvailable = if var37 == nil or var37.model == nil then nil else var37.model:IsDescendantOf(workspace),
			title = if var17 ~= nil then if var21.phase == "Expanding" or var21.phase == "World" then var9.world elseif var19 ~= nil then var9.title else var19.title elseif var37 ~= nil then var71 else var37.displayName,
			onBack = if var17 == nil and var19 == nil and var15.routeName ~= "Search" then if not var10 then var64 else nil else var38,
			query = if var17 == nil then var25 else nil,
			searchPlaceholder = var9.searchPlaceholder,
			onQueryChanged = if var17 == nil then var28 else nil,
			onSearchReset = if var17 == nil then var33 else nil,
			assetLabel = var71,
			worldLabel = var9.world,
			onShowLibrary = var64,
			onShowWorld = var66,
			onWorldViewportChanged = var65,
			worldCutout = var21.view,
			onLeave = function()
				-- upvalues: returnToAppChat (ref)
				returnToAppChat(nil, "close_button")
			end
		}, reactModule.createElement(libraryNavigatorModule, {
			externalDispatchConnector = var23,
			onNavigationStateChange = var24,
			screenProps = {
				library = library,
				isReady = var34,
				isOpen = var10,
				activeRouteKey = var15.key,
				query = var25,
				onBack = var38,
				onOpenItem = var40,
				onOpenCategory = var39,
				chatActions = var70,
				resourceActions = var14,
				unavailableText = var9.modelUnavailable,
				worldCutout = if var20 ~= nil then nil else {
					title = var9.world,
					onActivated = var67,
					onRectChanged = var21.onCellRectChanged
				}
			}
		})),
		Leaving = if var50 then reactModule.createElement(libraryLeavingOverlayModule, { ZIndex = 2 }) else nil,
		FirstFrameCover = if not var53 then reactModule.createElement(foundationModule.View, {
			ZIndex = 3,
			tag = "size-full bg-surface-0",
			testId = "Library.FirstFrameCover"
		}) else nil
	})
end

return function(p2, p3)
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
		local var44 = createBuildLibraryStoreModule(p2 or game)
		local var45 = reactRobloxModule.createRoot(buildExperienceLibrary)
		var2 = var45
		local var46 = localization.new(localizationService.RobloxLocaleId)
		local var47 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
		reactRobloxModule.flushSync(function()
			-- upvalues: var45 (ref), reactModule (copy), localizationProvider (copy), var46 (ref), libraryThemeProviderModule (copy), buildExperienceCompositionStyleSheetModule (copy), reactFocusNavigationModule (copy), var47 (ref), focusNavigationUtilsModule (copy), ConnectedLibrary (copy), p2 (ref), var44 (ref), p3 (ref), var2 (copy), buildExperienceLibrary (ref)
			var45:render(reactModule.createElement(localizationProvider, { localization = var46 }, {
				FoundationProvider = reactModule.createElement(libraryThemeProviderModule, { displayOrder = 10 }, {
					CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
					Library = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var47 }, {
						Registry = reactModule.createElement(focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider, nil, {
							Content = reactModule.createElement(ConnectedLibrary, {
								dataModel = p2 or game,
								library = var44,
								sessionId = p3,
								onUnmount = function()
									-- upvalues: var47 (copy), var2 (copy), buildExperienceLibrary (copy)
									var47:teardown()
									var2 = nil
									buildExperienceLibrary:Destroy()
								end
							})
						})
					})
				})
			}))
		end)
		
		return var45
	end
	return var2
end