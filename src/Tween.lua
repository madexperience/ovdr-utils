local RunService = game:GetService("RunService")

local Tween = {}
Tween.__index = Tween

export type Tween = {
    new: (obj: instance , duration: number, goal: {[string] : any?}) -> Tween;
    Play: () -> ();
    Stop: () -> ();
}

local function clamp(value, min, max)
    return math.max(min, math.min(value, max))
end

--UDim2랑 숫자 Vector, CFrame 지원

function Tween.new(obj, duration, goal)
    local self = setmetatable({}, Tween)
    self.obj = obj
    self.duration = duration
    self.goal = goal
    self.startValues = {}
    self.elapsedTime = 0
    self.running = false
    self.connection = nil

    for property, endValue in pairs(goal) do
        if typeof(obj[property]) == "number" then
            self.startValues[property] = obj[property]
        end
    end

    return self
end

function Tween:Play()
    if self.running then return end
    self.running = true

    self.connection = RunService.RenderStepped:Connect(function(delta)
        if not self.running then return end

        if self.elapsedTime < self.duration then
            self.elapsedTime = self.elapsedTime + delta
            local alpha = clamp(self.elapsedTime / self.duration, 0, 1)

            for property, startValue in pairs(self.startValues) do
                local endValue = self.goal[property]
                self.obj[property] = startValue + (endValue - startValue) * alpha
            end
        else
            for property, endValue in pairs(self.goal) do
                self.obj[property] = endValue
            end
            self:Stop()
        end
    end)
end

function Tween:Stop()
    if self.connection then
        self.connection:Disconnect()
        self.connection = nil
    end
    self.running = false
end

return Tween
