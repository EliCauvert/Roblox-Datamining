local function EmptyBanner()
	return nil
end

local EmptyBanner1 = EmptyBanner

return {
	set = function(p1)
		-- upvalues: EmptyBanner1 (ref), EmptyBanner (copy)
		EmptyBanner1 = p1 or EmptyBanner
	end,
	get = function()
		-- upvalues: EmptyBanner1 (ref)
		return EmptyBanner1
	end
}