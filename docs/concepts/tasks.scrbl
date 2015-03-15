#lang scribble/manual

@(require "../common.rkt")

@title[#:version version #:tag "tasks"]{Tasks}

A task is the execution of a script in an isolated environment with
dependent resources available to it. For example, running
@code{myrepo/scripts/test} in a Docker container with some parameters.

If the script exits @code{0}, the task succeeds. Otherwise, it fails.

A task can either be executed by a @seclink["jobs"]{Job} or executed manually
with the @seclink["fly"]{Fly} commandline. Both execute the same configuration,
giving the guarantee that locally-executed tasks with Fly are running the same
way they would in your pipeline.


@section{Runtime Environment}

A task's script is executed in a working directory containing all of the
task's fetched resources, and with any provided parameters set as
environment variables.

By default, tasks run as an unprivileged user. When run with
@code{privileged} enabled either by a job or with
@seclink["fly-execute"]{@code{fly execute}}, tasks run as @code{root} with
full capabilities.

Note that a task @emph{cannot} configure itself to be run with full
privileges. This is to prevent things like pull requests from escalating
privileges and running arbitrary code.

@inject-analytics[]
