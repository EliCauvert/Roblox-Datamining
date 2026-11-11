local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation

return function(p1)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), RoactNavigationModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseNavigationResult (copy), RoactNavigationModule (upval)
		local AddListenerResults = {}
		
		local function _(p2, p3)
			-- upvalues: p1 (upval), AddListenerResults (copy), UseNavigationResult (upval)
			if p1[p3] then
				table.insert(AddListenerResults, UseNavigationResult.addListener(p2, p1[p3]))
			end
		end
		
		local WillFocus = RoactNavigationModule.Events.WillFocus
		
		if p1.onWillFocus then
			table.insert(AddListenerResults, UseNavigationResult.addListener(WillFocus, p1.onWillFocus))
		end
		local WillBlur = RoactNavigationModule.Events.WillBlur
		
		if p1.onWillBlur then
			table.insert(AddListenerResults, UseNavigationResult.addListener(WillBlur, p1.onWillBlur))
		end
		local DidFocus = RoactNavigationModule.Events.DidFocus
		
		if p1.onDidFocus then
			table.insert(AddListenerResults, UseNavigationResult.addListener(DidFocus, p1.onDidFocus))
		end
		local DidBlur = RoactNavigationModule.Events.DidBlur
		
		if p1.onDidBlur then
			table.insert(AddListenerResults, UseNavigationResult.addListener(DidBlur, p1.onDidBlur))
		end
		return function()
			-- upvalues: AddListenerResults (copy)
			for _, addListenerResult in AddListenerResults do
				addListenerResult.remove()
			end
		end
	end, {
		p1.onWillFocus,
		p1.onWillBlur,
		p1.onDidFocus,
		p1.onDidBlur
	})
end