local FFlagAXPPEReturnToEntrySurface = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.SharedFlags).FFlagAXPPEReturnToEntrySurface
local EntrySurfaceModule = require(script.Parent.entrySurface)

return function(p1)
	-- upvalues: EntrySurfaceModule (copy), FFlagAXPPEReturnToEntrySurface (copy)
	if not p1 then return end
	local ResolveResult, ResolveResult2 = EntrySurfaceModule.resolve(p1)
	
	if ResolveResult and p1.navigate then
		if FFlagAXPPEReturnToEntrySurface then
			EntrySurfaceModule.park(p1, ResolveResult)
		end
		if ResolveResult2 then
			p1.navigate(ResolveResult, ResolveResult2)
			
			return
		else
			p1.navigate(ResolveResult)
			
			return
		end
	elseif p1.goBack then
		p1.goBack()
		
		return
	else
		if p1.pop then
			p1.pop()
		end
	end
end