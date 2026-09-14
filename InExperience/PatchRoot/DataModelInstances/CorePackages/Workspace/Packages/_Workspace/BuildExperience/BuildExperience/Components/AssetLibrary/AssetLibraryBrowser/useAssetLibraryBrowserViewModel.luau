local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local assetLibraryCategoriesModule = require(script.Parent.Parent.AssetLibraryCategories)
local _ = require(script.Parent.AssetLibraryBrowserView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local _ = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels)
local useDataModelAssetLibraryModule = require(script.Parent.Parent.useDataModelAssetLibrary)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), useDataModelAssetLibraryModule (ref), reactModule (ref), sendBuildExperienceEventModule (ref), assetLibraryCategoriesModule (ref)
	local var1 = useAssetLibraryStringsModule()
	local var2 = useDataModelAssetLibraryModule({
		dependencies = value.liveModelDependencies,
		placeId = value.placeId
	})
	local var3 = reactModule.useRef({
		Model = "NotReady",
		Image = "NotReady",
		Audio = "NotReady"
	})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), sendBuildExperienceEventModule (copy), value (ref), var2 (ref)
		local function reportFailure(p1, p2)
			-- upvalues: var3 (copy), sendBuildExperienceEventModule (copy), value (copy)
			if p2 == "Failed" and var3.current[p1] ~= "Failed" then
				sendBuildExperienceEventModule("ASSET_LIBRARY_FETCH_FAILED", { universeId = value.universeId }, { assetType = tostring(p1) })
			end
			var3.current[p1] = p2
		end
		
		for i, v in { "Model", "Image", "Audio" } do
			reportFailure(v, var2.status)
		end
	end, { var2.status, value.universeId })
	
	local function makeCategory(p1)
		-- upvalues: var2 (ref), value (ref)
		local assetType = p1.assetType
		local t = {}
		local var4 = 0
		local snapshot = var2.snapshot
		
		if snapshot ~= nil then
			for i, v in snapshot.categories do
				if v.key == p1.key then
					var4 = v.count or #v.items
					
					for i_1, v_1 in v.items do
						table.insert(t, v_1)
					end
					break
				end
			end
		end
		if var2.status == "Ready" and var4 == 0 then
			return nil
		end
		local var5 = t[1]
		
		return {
			hasMore = false,
			coverage = "Complete",
			categoryKey = p1.key,
			sectionTitle = p1.sectionTitle,
			assetType = assetType,
			title = p1.title,
			assets = {
				{
					tileKey = `library-category-{p1.key}`,
					assetType = assetType,
					displayName = p1.title,
					subtitle = if var2.status == "Ready" then tostring(var4) else nil,
					thumbnail = if var5 ~= nil then nil else var5.thumbnail,
					model = if var5 ~= nil then nil else var5.model,
					item = var5,
					onActivated = if value.onOpenCategory == nil then nil else function()
						-- upvalues: value (copy), assetType (ref), p1 (ref)
						value.onOpenCategory(assetType, p1.key, p1.title)
					end
				}
			},
			status = var2.status,
			onOpenCategory = if value.onOpenCategory == nil then nil else function()
				-- upvalues: value (copy), assetType (ref), p1 (ref)
				value.onOpenCategory(assetType, p1.key, p1.title)
			end,
			onOpenSection = if value.onOpenCategory == nil then nil else function()
				-- upvalues: value (copy), assetType (ref), p1 (ref)
				value.onOpenCategory(assetType, p1.sectionPageKey, p1.sectionTitle or p1.title)
			end,
			onRetry = function()
				-- upvalues: var2 (copy)
				if var2.onRetry ~= nil then
					var2.onRetry()
				end
			end
		}
	end
	
	local t = {}
	
	for i, v in assetLibraryCategoriesModule.definitions do
		local var6 = makeCategory(v)
		
		if var6 ~= nil then
			table.insert(t, var6)
		end
	end
	return {
		categories = t,
		strings = var1,
		onBack = value.onBack,
		presentation = value.presentation
	}
end