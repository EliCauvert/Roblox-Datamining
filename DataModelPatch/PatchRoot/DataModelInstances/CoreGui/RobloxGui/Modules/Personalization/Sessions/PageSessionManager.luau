local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseRouteNameFunction = require(CorePackages.Workspace.Packages.Navigation).useRouteName
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: ReactModule (copy), UseRouteNameFunction (copy), UseSelectorFunction (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRouteNameResult = UseRouteNameFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		return p2.Personalization.PageSessionTimestamp[p1.appPage]
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseRouteNameResult (copy), p1 (copy), UseSelectorResult (copy), UseRefResult1 (copy), UseRefResult (copy)
		if UseRouteNameResult ~= p1.appPage then return end
		if UseSelectorResult == nil then return end
		if UseRefResult1.current == nil then
			UseRefResult1.current = UseSelectorResult
		end
		if not UseRefResult.current or UseSelectorResult ~= nil and UseRefResult1.current < UseSelectorResult then
			UseRefResult.current = true
			
			if p1.setPageSession then
				p1.setPageSession()
			end
			UseRefResult1.current = UseSelectorResult
		end
		return function()
			-- upvalues: p1 (upval)
			if p1.clearPageSession then
				p1.clearPageSession()
			end
		end
	end, {
		UseRouteNameResult,
		p1.appPage,
		UseSelectorResult,
		p1.setPageSession,
		p1.clearPageSession
	})
	
	return nil
end