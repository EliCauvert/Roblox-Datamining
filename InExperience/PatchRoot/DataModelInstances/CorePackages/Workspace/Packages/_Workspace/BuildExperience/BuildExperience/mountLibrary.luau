local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local signalsReactModule = require(parent.SignalsReact)
local robloxAppLocalesModule = require(parent.RobloxAppLocales)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local libraryBrowserContainerModule = require(buildExperience.Components.Library.LibraryBrowser.LibraryBrowserContainer)
local libraryCategoryContainerModule = require(buildExperience.Components.Library.LibraryCategory.LibraryCategoryContainer)
local libraryDetailContainerModule = require(buildExperience.Components.Library.LibraryDetail.LibraryDetailContainer)
local librarySheetModule = require(buildExperience.Components.Library.LibrarySheet)
local _ = require(buildExperience.Components.Library.LibraryCategories)
local _ = require(buildExperience.Components.Library.LibraryDataStore)
local useLibraryStringsModule = require(buildExperience.Components.Library.useLibraryStrings)
local getLibraryStoreModule = require(buildExperience.Stores.GetLibraryStore)
local createLibraryBrowseStoreModule = require(buildExperience.Stores.Library.createLibraryBrowseStore)
local isLibraryAvailableInExperienceModule = require(buildExperience.utils.isLibraryAvailableInExperience)
local localizationProvider = localizationModule.LocalizationProvider
local localization = robloxAppLocalesModule.Localization
local _ = require(buildExperience.Components.Library.LibraryTypes)
local var1 = nil

local function focusModel(p1, p2)
	-- upvalues: var1 (write), coreGuiService (ref)
	local boundingBox, boundingBox_1 = p1.model:GetBoundingBox()
	
	if var1 ~= nil then
		var1:Destroy()
	end
	local buildLibraryFocusHighlight = Instance.new("Highlight")
	buildLibraryFocusHighlight.Name = "BuildLibraryFocusHighlight"
	buildLibraryFocusHighlight.DepthMode = Enum.HighlightDepthMode.Occluded
	buildLibraryFocusHighlight.OutlineColor = Color3.fromRGB(0, 200, 255)
	buildLibraryFocusHighlight.FillColor = Color3.fromRGB(0, 170, 255)
	buildLibraryFocusHighlight.FillTransparency = 0.75
	buildLibraryFocusHighlight.Adornee = p1.model
	buildLibraryFocusHighlight.Parent = coreGuiService
	var1 = buildLibraryFocusHighlight
	pcall(function()
		-- upvalues: p1 (ref)
		game:GetService("Selection"):Set({ p1.model })
	end)
	p2.requestFocus(boundingBox.Position, boundingBox_1.Magnitude / 2)
end

local function resolveFocusTarget(p1)
	-- upvalues: coreGuiService (ref)
	local teamCreateFocusTarget = coreGuiService:FindFirstChild("TeamCreateFocusTarget")
	
	if teamCreateFocusTarget == nil or not teamCreateFocusTarget:IsA("ObjectValue") then
		return nil
	end
	local value = teamCreateFocusTarget.Value
	
	return if value == nil or not value:IsA("Model") or not value:IsDescendantOf(workspace) then nil else {
		id = p1,
		path = value:GetFullName(),
		displayName = value.Name,
		className = value.ClassName,
		model = value
	}
end

local function ConnectedLibrary(p1)
	-- upvalues: getLibraryStoreModule (ref), useLibraryStringsModule (ref), signalsReactModule (ref), reactModule (ref), createLibraryBrowseStoreModule (ref), coreGuiService (ref), resolveFocusTarget (ref), focusModel (ref), libraryDetailContainerModule (ref), libraryCategoryContainerModule (ref), libraryBrowserContainerModule (ref), librarySheetModule (ref)
	local var2 = getLibraryStoreModule()
	local var3 = useLibraryStringsModule()
	local var4 = var2.useIsOpen()
	local var5 = signalsReactModule.useSignalState(var2.getChatComposerState)
	local var6 = if var5 ~= nil then nil else var5.onAddReference
	local var7 = if var5 ~= nil then nil else var5.onRemoveReferenceByPath
	local var8 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), var7 (ref), var2 (ref)
		return if var6 == nil or var7 == nil then {
			onAddReference = function(p2)
				-- upvalues: var2 (copy)
				var2.requestAddToChat(p2)
				
				return true
			end,
			onRemoveReference = var2.requestRemoveFromChat
		} else {
			onAddReference = var6,
			onRemoveReference = function(p2)
				-- upvalues: var7 (copy)
				var7(p2.path)
			end
		}
	end, { var6 or false, var7 or false, var2 })
	local model, model_1 = reactModule.useState("Model")
	local var9, var10 = reactModule.useState(nil)
	local var11, var12 = reactModule.useState(nil)
	local var13 = reactModule.useRef(0)
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useMemo(function()
		-- upvalues: createLibraryBrowseStoreModule (copy)
		return createLibraryBrowseStoreModule()
	end, {})
	local var16 = reactModule.useMemo(function()
		return { kind = "LocalDataModel", placeId = game.PlaceId }
	end, {})
	signalsReactModule.useSignalState(var15.getDebouncedQuery)
	local var17 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var12 (ref), var2 (ref)
		var10(nil)
		var12(nil)
		var2.setIsOpen(false)
	end, { var2 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var10 (ref), var12 (ref)
		if var9 == nil then
			var12(nil)
			
			return
		end
		var10(nil)
	end, { var9 })
	local var19 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var12 (ref)
		var12({ itemKind = p2, categoryKey = p3, title = p4 })
	end, {})
	local var20 = reactModule.useCallback(function(p2, p3)
		-- upvalues: model_1 (ref), var10 (ref)
		model_1(p3)
		var10(p2)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var15 (ref)
		return function()
			-- upvalues: var15 (copy)
			var15.destroy()
		end
	end, { var15 })
	reactModule.useEffect(function()
		-- upvalues: coreGuiService (copy), var14 (ref), var13 (ref), resolveFocusTarget (copy), p1 (ref), var12 (ref), var10 (ref), var2 (ref), focusModel (copy)
		local function consumePromotionCommand()
			-- upvalues: coreGuiService (copy)
			game:SetAttribute("BuildLibraryFocusRequested", nil)
			local teamCreateFocusTarget = coreGuiService:FindFirstChild("TeamCreateFocusTarget")
			
			if teamCreateFocusTarget ~= nil and teamCreateFocusTarget:IsA("ObjectValue") then
				teamCreateFocusTarget.Value = nil
			end
			game:SetAttribute("BuildLibrarySelectedItemId", nil)
			game:SetAttribute("BuildLibrarySelectedPath", nil)
		end
		
		local function applyPromotionCommand()
			-- upvalues: var14 (copy), var13 (copy), resolveFocusTarget (copy), p1 (copy), consumePromotionCommand (ref), var12 (copy), var10 (copy), var2 (copy), focusModel (copy)
			if game:GetAttribute("BuildLibraryFocusRequested") ~= true then return end
			local buildLibrarySelectedItemIdAttribute = game:GetAttribute("BuildLibrarySelectedItemId")
			
			if type(buildLibrarySelectedItemIdAttribute) ~= "string" then return end
			if var14.current == buildLibrarySelectedItemIdAttribute then
				return
			end
			var14.current = buildLibrarySelectedItemIdAttribute
			var13.current += 1
			local current = var13.current
			
			local function resolve(p2)
				-- upvalues: var13 (copy), current (ref), resolveFocusTarget (copy), buildLibrarySelectedItemIdAttribute (ref), p1 (copy), resolve (ref), var14 (copy), consumePromotionCommand (copy), var12 (copy), var10 (copy), var2 (copy), focusModel (copy)
				if var13.current ~= current then return end
				local var21 = resolveFocusTarget(buildLibrarySelectedItemIdAttribute)
				
				if var21 ~= nil then
					var14.current = nil
					consumePromotionCommand()
					var12(nil)
					var10(nil)
					var2.setIsOpen(false)
					focusModel(var21, var2)
					
					return
				elseif p2 < (if p1.promotionRetryOptions == nil or p1.promotionRetryOptions.maxAttempts == nil then 60 else p1.promotionRetryOptions.maxAttempts) then
					if p1.promotionRetryOptions == nil or p1.promotionRetryOptions.scheduleDelay == nil then
						task.delay(0.1, resolve, p2 + 1)
						
						return
					end
					p1.promotionRetryOptions.scheduleDelay(0.1, function()
						-- upvalues: resolve (copy), p2 (ref)
						resolve(p2 + 1)
					end)
					
					return
				else
					var14.current = nil
					consumePromotionCommand()
					warn(`Unable to resolve TeamCreate focus target {buildLibrarySelectedItemIdAttribute}`)
				end
			end
			
			resolve(1)
		end
		
		applyPromotionCommand()
		local list = {
			game:GetAttributeChangedSignal("BuildLibraryFocusRequested"):Connect(applyPromotionCommand),
			game:GetAttributeChangedSignal("BuildLibrarySelectedItemId"):Connect(applyPromotionCommand),
			game:GetAttributeChangedSignal("BuildLibrarySelectedPath"):Connect(applyPromotionCommand)
		}
		
		return function()
			-- upvalues: var13 (copy), list (ref)
			var13.current += 1
			
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { p1.promotionRetryOptions or false, var2 })
	
	return reactModule.createElement(librarySheetModule, { isOpen = var4, onClose = var17 }, if var9 ~= nil then if var11 ~= nil then reactModule.createElement(libraryBrowserContainerModule, {
		sessionId = nil,
		presentation = "Sheet",
		universeId = game.GameId,
		placeId = game.PlaceId,
		onBack = var17,
		onOpenItem = var20,
		onOpenCategory = var19,
		source = var16,
		browseStore = var15
	}) else reactModule.createElement(libraryCategoryContainerModule, {
		presentation = "Sheet",
		universeId = game.GameId,
		placeId = game.PlaceId,
		itemKind = var11.itemKind,
		categoryKey = var11.categoryKey,
		title = var11.title,
		query = var15.getDebouncedQuery(false),
		onBack = var18,
		onOpenItem = var20,
		source = var16,
		browseStore = var15
	}) else reactModule.createElement(libraryDetailContainerModule, {
		presentation = "Sheet",
		isActive = var4,
		itemId = var9,
		itemKind = model,
		source = var16,
		onBack = var18,
		onSeeInWorld = reactModule.useCallback(function(p2)
			-- upvalues: focusModel (copy), var2 (ref), var10 (ref), var12 (ref)
			if p2.model ~= nil and p2.model:IsDescendantOf(workspace) then
				focusModel({
					id = p2.id,
					path = p2.path,
					displayName = p2.displayName,
					className = p2.className,
					model = p2.model
				}, var2)
				var10(nil)
				var12(nil)
				var2.setIsOpen(false)
			end
		end, { var2 }),
		chatActions = var5,
		referenceActions = var8,
		unavailableText = var3.modelUnavailable
	}))
end

return function(_, p2)
	-- upvalues: getLibraryStoreModule (ref), isLibraryAvailableInExperienceModule (ref), coreGuiService (ref), reactRobloxModule (ref), localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), ConnectedLibrary (ref)
	getLibraryStoreModule().setIsOpen(false)
	
	if isLibraryAvailableInExperienceModule() then
		local buildExperienceLibrary = Instance.new("ScreenGui")
		buildExperienceLibrary.Name = "BuildExperienceLibrary"
		buildExperienceLibrary.IgnoreGuiInset = true
		buildExperienceLibrary.ResetOnSpawn = false
		buildExperienceLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		buildExperienceLibrary.DisplayOrder = 8
		buildExperienceLibrary.Parent = coreGuiService
		local var21 = reactRobloxModule.createRoot(buildExperienceLibrary)
		var21:render(reactModule.createElement(localizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, {
				colorMode = foundationModule.Enums.ColorMode.Dark,
				overlayGui = { DisplayOrder = 8 }
			}, {
				CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
				Library = reactModule.createElement(ConnectedLibrary, { promotionRetryOptions = p2 })
			})
		}))
		
		return var21
	end
	return nil
end