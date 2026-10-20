local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseGetCurrentCategoryNamesModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetCurrentCategoryNames)

return function()
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), UseGetCurrentCategoryNamesModule (copy), CryoModule (copy), CatalogTilesLatencyTrackerModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if not p1 or not p2 then return end
		if not UseRefResult.current then
			UseStateResult2(function(Tbl)
				-- upvalues: p1 (copy), p2 (copy)
				local Copy = table.clone(Tbl)
				local Copy1 = table.clone(Tbl[p1] or {})
				table.insert(Copy1, p2)
				Copy[p1] = Copy1
				
				return Copy
			end)
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current = false
		end
	end, { (UseGetCurrentCategoryNamesModule()) })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), CryoModule (upval), UseDispatchResult (copy), CatalogTilesLatencyTrackerModule (upval), UseRefResult (copy), UseStateResult2 (copy)
		if next(UseStateResult) == nil then return end
		local FilterResult = CryoModule.Dictionary.filter(UseStateResult, function(_, p1): boolean
			return #p1 > 0
		end)
		
		if next(FilterResult) ~= nil then
			UseDispatchResult(CatalogTilesLatencyTrackerModule.AppendThumbnails(FilterResult))
			UseRefResult.current = true
			UseStateResult2({})
		end
	end, { UseStateResult, UseDispatchResult })
	
	return UseResult
end