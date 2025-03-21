local RunService = game:GetService("RunService")

local task = {}

export type task = {
  spawn: (f: (...any) -> any) -> thread?;
  delay: (n: number , f: (...any) -> any) -> ();
  cancel: (t: thread) -> ();
  wait: (n: number?) -> number?;
}

function task.spawn(): thread?
  local thread = coroutine.create(f)
  coroutine.resume(thread)
  return thread
end

function task.delay(n, f): ()
  return task.spawn(function()
	task.wait(n)
	task.spawn(f)
  end)
end

function task.cancel(t): ()
  coroutine.close(t)
end

function task.wait(n)
  local elapsedTime = 0
  while elapsedTime < n do
    local dt = RunService.Heartbeat:Wait()
    elapsedTime = elapsedTime + dt
  end

  return elapsedTime
end

return task