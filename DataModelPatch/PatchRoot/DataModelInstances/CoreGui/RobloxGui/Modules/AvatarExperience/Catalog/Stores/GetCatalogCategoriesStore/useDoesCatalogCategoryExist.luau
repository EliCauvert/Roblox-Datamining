local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local _ = require(script.Parent.createCatalogCategoriesStore)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), p2 (copy), p3 (copy)
		return SignalsModule.createComputed(function(p4): boolean
			-- upvalues: p1 (upval), p2 (upval), p3 (upval)
			local CategoriesMap = p1.getCategoriesMap(p4)
			
			if p2 then
				local Categories = CategoriesMap[p2]
				
				return if Categories then not p3 or Categories.SubcategoriesMap ~= nil and Categories.SubcategoriesMap[p3] ~= nil else false
			else
				return false
			end
		end)
	end, { p2, p3 })))
end