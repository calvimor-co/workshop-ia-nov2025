"use client";

import useSWR from "swr";
import { fetchHealth } from "@/lib/api";
import { HealthResponse } from "@/lib/types";

export default function Home() {
  const { data, error, isLoading } = useSWR<HealthResponse>(
    "/api/v1/health",
    fetchHealth,
    { refreshInterval: 30000 },
  );

  const isHealthy = data?.status === "healthy";

  return (
    <div className="min-h-screen bg-linear-to-br from-slate-900 to-slate-800 flex flex-col">
      {/* Main Content */}
      <main className="flex-1 flex items-center justify-center px-4 py-20">
        <div className="max-w-2xl w-full">
          {/* Title */}
          <h1 className="text-5xl font-bold text-white mb-4 text-center">
            Top SaaS Workshop
          </h1>
          <p className="text-xl text-slate-300 mb-12 text-center">
            Backend and Frontend Integration Demo
          </p>

          {/* Backend Status Card */}
          <div className="bg-slate-800 rounded-lg shadow-2xl p-8 border border-slate-700">
            <div className="flex items-center gap-4 mb-6">
              <div
                className={`w-4 h-4 rounded-full ${isHealthy
                    ? "bg-green-500 animate-pulse"
                    : error
                      ? "bg-red-500 animate-pulse"
                      : "bg-yellow-500 animate-pulse"
                  }`}
              />
              <h2 className="text-2xl font-semibold text-white">
                Backend Status
              </h2>
            </div>

            {/* Loading State */}
            {isLoading && (
              <div className="space-y-4">
                <div className="h-4 bg-slate-700 rounded animate-pulse" />
                <div className="h-4 bg-slate-700 rounded animate-pulse w-5/6" />
              </div>
            )}

            {/* Error State */}
            {error && !isLoading && (
              <div className="bg-red-500/20 border border-red-500/50 rounded-lg p-4">
                <p className="text-red-200 text-sm">
                  <strong>Error:</strong> Unable to connect to backend. Make sure
                  the backend server is running on port 8000.
                </p>
              </div>
            )}

            {/* Success State */}
            {data && !error && (
              <div className="space-y-4">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <p className="text-slate-400 text-sm font-medium mb-1">
                      Status
                    </p>
                    <p className="text-lg font-semibold text-green-400">
                      {data.status}
                    </p>
                  </div>
                  <div>
                    <p className="text-slate-400 text-sm font-medium mb-1">
                      Version
                    </p>
                    <p className="text-lg font-semibold text-slate-200">
                      {data.version}
                    </p>
                  </div>
                  <div>
                    <p className="text-slate-400 text-sm font-medium mb-1">
                      Environment
                    </p>
                    <p className="text-lg font-semibold text-slate-200">
                      {data.environment}
                    </p>
                  </div>
                  <div>
                    <p className="text-slate-400 text-sm font-medium mb-1">
                      Last Check
                    </p>
                    <p className="text-lg font-semibold text-slate-200">
                      {new Date(data.timestamp).toLocaleTimeString()}
                    </p>
                  </div>
                </div>

                {/* Auto-refresh Info */}
                <div className="text-xs text-slate-500 mt-6 pt-4 border-t border-slate-700">
                  Auto-refreshing every 30 seconds
                </div>
              </div>
            )}
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="bg-slate-900/50 border-t border-slate-700 px-4 py-8">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-8">
            <div>
              <h3 className="text-sm font-semibold text-white mb-3 uppercase tracking-wide">
                Frontend
              </h3>
              <ul className="space-y-2 text-sm text-slate-400">
                <li>
                  <span className="font-medium text-slate-300">Next.js</span> 16
                </li>
                <li>
                  <span className="font-medium text-slate-300">TypeScript</span>
                </li>
                <li>
                  <span className="font-medium text-slate-300">Tailwind CSS</span>
                </li>
                <li>
                  <span className="font-medium text-slate-300">SWR</span>
                </li>
              </ul>
            </div>
            <div>
              <h3 className="text-sm font-semibold text-white mb-3 uppercase tracking-wide">
                Backend
              </h3>
              <ul className="space-y-2 text-sm text-slate-400">
                <li>
                  <span className="font-medium text-slate-300">FastAPI</span>
                </li>
                <li>
                  <span className="font-medium text-slate-300">Python</span> 3.12
                </li>
                <li>
                  <span className="font-medium text-slate-300">Pydantic</span>
                </li>
                <li>
                  <span className="font-medium text-slate-300">Uvicorn</span>
                </li>
              </ul>
            </div>
            <div>
              <h3 className="text-sm font-semibold text-white mb-3 uppercase tracking-wide">
                Infrastructure
              </h3>
              <ul className="space-y-2 text-sm text-slate-400">
                <li>
                  Frontend: <span className="font-medium text-slate-300">http://localhost:3000</span>
                </li>
                <li>
                  Backend API: <span className="font-medium text-slate-300">http://localhost:8000</span>
                </li>
                <li>
                  API Docs: <span className="font-medium text-slate-300">http://localhost:8000/docs</span>
                </li>
              </ul>
            </div>
          </div>
          <div className="border-t border-slate-700 pt-6 text-center text-sm text-slate-500">
            <p>
              Workshop IA Nov 2025 • Top SaaS Backend and Frontend Integration
            </p>
          </div>
        </div>
      </footer>
    </div>
  );
}
