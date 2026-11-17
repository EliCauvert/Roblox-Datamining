local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local FFlagMomentsHideNavBarOnScrollModule = require(Moments.Flags.FFlagMomentsHideNavBarOnScroll)
local Context = ReactModule.createContext(0)
local Context1 = if FFlagMomentsHideNavBarOnScrollModule then ReactModule.createContext(nil) else nil

return {
	Context = Context,
	RatioContext = Context1,
	useMomentOverlayInset = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end,
	useMomentOverlayInsetRatio = function()
		-- upvalues: Context1 (copy), ReactModule (copy)
		return if Context1 == nil then nil else ReactModule.useContext(Context1)
	end,
	mapSlidingInsetPadding = function(p1, p2, p3)
		return p1:map(function(p4): UDim
			-- upvalues: p3 (copy), p2 (copy)
			return UDim.new(0, p3 + math.round(p2 * p4))
		end)
	end
}