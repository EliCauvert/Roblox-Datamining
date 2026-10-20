local ConstantsModule = require(script.Parent.Parent.Constants)

return function(p1)
	-- upvalues: ConstantsModule (copy)
	if not p1:getState()[ConstantsModule.RoduxKey].IsOverlayFlashActive then return end
	local CurrentTime = tick()
	while p1:getState()[ConstantsModule.RoduxKey].IsOverlayFlashActive and ConstantsModule.FlashTimeout >= tick() - CurrentTime do
		task.wait()
	end
end