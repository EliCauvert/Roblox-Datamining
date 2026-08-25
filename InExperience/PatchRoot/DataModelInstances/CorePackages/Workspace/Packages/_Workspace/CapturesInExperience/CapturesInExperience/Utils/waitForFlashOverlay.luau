local constantsModule = require(script.Parent.Parent.Constants)

return function(p0)
	-- upvalues: constantsModule (ref)
	if not p0:getState()[constantsModule.RoduxKey].IsOverlayFlashActive then return end
	local currentTime = tick()
	while p0:getState()[constantsModule.RoduxKey].IsOverlayFlashActive and constantsModule.FlashTimeout >= tick() - currentTime do
		task.wait()
	end
end