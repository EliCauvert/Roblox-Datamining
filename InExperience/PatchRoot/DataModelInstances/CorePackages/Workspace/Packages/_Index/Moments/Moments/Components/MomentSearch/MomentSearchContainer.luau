local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MomentSearchViewModule = require(script.Parent.MomentSearchView)
local UseMomentSearchViewModelModule = require(script.Parent.useMomentSearchViewModel)

return function(p1)
	-- upvalues: UseMomentSearchViewModelModule (copy), ReactModule (copy), FoundationModule (copy), MomentSearchViewModule (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full" }, {
		Theme = ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			Search = ReactModule.createElement(MomentSearchViewModule, (UseMomentSearchViewModelModule(p1)))
		})
	})
end